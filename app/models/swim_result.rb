class SwimResult < LegResult
  include Mongoid::Document

  field :pace_100,    type: Float, as: :pace_100

  def calc_ave 
    if self.event && self.secs
      self.pace_100 = (self.secs/60)
    end 
  end  

  

end
