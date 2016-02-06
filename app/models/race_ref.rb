class RaceRef
  include Mongoid::Document

  field :n,       type: String, as: :name
  field :date,    type: Date, as: :date

  embedded_in :entrant, class_name: 'Entrant'
  belongs_to :race, class_name: 'Race', foreign_key: '_id'

end
