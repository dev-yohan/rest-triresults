class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps
  store_in collection: 'results'

  field :bib,     type: Integer, as: :bib
  field :secs,    type: Float, as: :secs
  field :o,       type: Placing, as: :overall
  field :gender,  type: Placing, as: :gender
  field :group,   type: Placing, as: :group

  embeds_many :results, class_name: 'LegResult', as: :entrant, after_add: :update_total, after_remove: :update_total
  embeds_one :race, class_name: 'RaceRef'
  embeds_one :racer, class_name: 'RacerInfo', as: :parent

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

end
