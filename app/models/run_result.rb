class RunResult < LegResult
  include Mongoid::Document

  field :mmile,    type: Float, as: :minute_mile

  def calc_ave 
    if self.event && self.secs
      self.mmile = (self.secs/60)
    end  
  end  

  
end
