class RaceRef
  include Mongoid::Document

  field :n,       type: String, as: :name
  field :date,    type: Date, as: :date

  embedded_in :entrant, class_name: 'Entrant'

end
