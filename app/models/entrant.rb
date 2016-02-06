class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps
  store_in collection: 'results'

  field :bib,     type: Integer, as: :bib
  field :secs,    type: Float, as: :secs
  field :o,       type: Placing, as: :overall
  field :gender,  type: Placing, as: :gender
  field :group,   type: Placing, as: :group

  embeds_many :results, class_name: 'LegResult', as: :entrant

end
