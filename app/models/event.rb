class Event
  include Mongoid::Document

   field :o,     type: Integer, as: :order
   field :n,     type: String, as: :name 
   field :d,     type: Float, as: :distance
   field :u,     type: String, as: :units

   def meters
    if self.u == "meters"
      self.d
    elsif self.u == "miles"
      self.d * 1609.34
    elsif self.u == "kilometers"
      self.d * 1000
    elsif self.u == "yards"
      self.d * 0.9144   
    end
   end 

   def miles
    if self.u == "miles"
      self.d 
    elsif self.u == "meters"
      self.d * 0.000621371
    elsif self.u == "kilometers"
      self.d * 0.621371
    elsif self.u == "yards"
      self.d * 0.000568182
    end  
   end

end
