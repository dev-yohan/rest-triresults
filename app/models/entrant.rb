class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  store_in collection: 'results'

  field :bib,     type: Integer, as: :bib
  field :secs,    type: Float, as: :secs
  field :o,       type: Placing, as: :overall
  field :gender,  type: Placing, as: :gender
  field :group,   type: Placing, as: :group

  embeds_many :results, class_name: 'LegResult', as: :entrant, after_add: :update_total, after_remove: :update_total
  embeds_one :race, class_name: 'RaceRef', autobuild: true
  embeds_one :racer, class_name: 'RacerInfo', as: :parent, autobuild: true

  delegate :first_name, :first_name=, to: :racer
  delegate :last_name, :last_name=, to: :racer
  delegate :gender, :gender=, to: :racer, prefix: "racer"
  delegate :birth_year, :birth_year=, to: :racer
  delegate :city, :city=, to: :racer
  delegate :state, :state=, to: :racer

  delegate :name, :name=, to: :race, prefix: "race"
  delegate :date, :date=, to: :race, prefix: "race"

  default_scope ->{order_by(:"event.o".desc)}

  def update_total(result)
    self.secs = 0
    self.results.each do |res|
      if res.secs
        self.secs = self.secs + res.secs
      end  
    end  
    
  end

  def the_race
    self.race.race
  end  

  def overall_place
    overall.place if overall
  end

  def gender_place
    gender.place if gender
  end

  def group_name
    group.name if group
  end

  def group_place
    group.place if group
  end

end
