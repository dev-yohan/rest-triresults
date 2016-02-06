class BikeResult < LegResult
  include Mongoid::Document

  field :mph,    type: Float, as: :mph

  def calc_ave 
    if self.event && self.secs
      self.mph = (self.secs/60)
    end 
  end  

  
end
