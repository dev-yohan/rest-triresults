class Racer
  include Mongoid::Document
  

  before_create do |racer|
    racer.info.id = racer.id
  end

  embeds_one :info, class_name: 'RacerInfo', as: :parent, autobuild: true
  has_many :races, class_name: 'Entrant', foreign_key: 'racer.racer_id', dependent: :nullify, order: :"race.date".desc

end