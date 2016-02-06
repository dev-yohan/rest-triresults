class Address
  #include Mongoid::Document
  #include Mongoid::Timestamps

  #field :city, type: String, as: :city
  #field :state, type: String, as: :state
  #field :location, type: Point, as: :loc

   attr_accessor :city, :state, :location
 
  def initialize city = nil, state = nil, loc = nil
    @city = city unless city.nil?
    @state = state unless state.nil?
    @location = Point.new(loc[:coordinates][0], loc[:coordinates][1]) if loc && loc[:coordinates] unless loc.nil?
  end


   #creates a DB-form of the instance
  def mongoize
    {:city => @city, :state => @state, :loc => @location.mongoize}
  end

  #creates an instance of the class from the DB-form of the data
  def self.demongoize(object)
    case object
      when nil then
        nil
      when Hash then
        Address.new(object[:city], object[:state], object[:loc])
      when Address then
        object
    end  
  end

  def self.mongoize(object) 
    case object
      when Address then object.mongoize
      when Hash then 
        Address.new(object[:city], object[:state], object[:loc]).mongoize
      else object
    end
  end
  
  #used by criteria to convert object to DB-friendly form
  def self.evolve(object)
    case object
      when nil then nil 
      when Hash then object 
      when Address then object.mongoize
    end
  end

end  