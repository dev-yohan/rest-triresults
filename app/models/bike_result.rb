class BikeResult < LegResult
  include Mongoid::Document

  field :mph,    type: Float, as: :mph

  def calc_ave 
    if event && secs
      miles = event.miles
      self.mph = miles.nil? ? nil : miles*3600/secs
    end
  end  

  
end
