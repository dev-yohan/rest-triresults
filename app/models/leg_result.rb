class LegResult
  include Mongoid::Document
  after_initialize :calc_ave

  field :secs,    type: Float, as: :secs

  embedded_in :entrant, class_name: 'Entrant'
  embeds_one :event, as: :parent

  validates :event, presence: true

  def calc_ave
    
  end  

  def secs= value
    self[:secs] = value
    self.calc_ave
  end


end
