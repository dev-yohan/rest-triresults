class Race
  include Mongoid::Document
  include Mongoid::Timestamps

  field :n,     type: String, as: :name 
  field :date,  type: Date, as: :date
  field :loc,   type: Address, as: :location

  embeds_many :events, class_name: 'Event', as: :parent, order: [:order.asc]
  has_many :entrants, class_name: 'Entrant', foreign_key: 'race._id', order: [:secs.asc, :bib.asc], dependent: :delete

  scope :upcoming, ->{ where(:date.gte => Date.today) }
  scope :past, ->{ where(:date.lt => Date.today) }


end
