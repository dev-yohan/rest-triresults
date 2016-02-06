class RunResult < LegResult
  include Mongoid::Document

  field :mmile,    type: Float, as: :minute_mile

  def calc_ave  
    if event && secs
      miles = event.miles
      self.mmile = miles.nil? ? nil : (secs/60)/miles
    end
  end  

  
end
