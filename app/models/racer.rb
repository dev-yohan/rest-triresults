class Racer
  include Mongoid::Document
  

  before_create do |racer|
    racer.info.id = racer.id
  end

  embeds_one :info, class_name: 'RacerInfo', as: :parent, autobuild: true

end