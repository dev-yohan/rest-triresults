json.place @object.place
json.time @object.time
json.last_name @object.last_name
json.first_name @object.first_name
json.bib @object.bib
json.city @object.city
json.state @object.state
json.gender @object.gender
json.gender_place @object.gender_place
json.group @object.group
json.group_place @object.group_place
json.swim @object.swim
json.pace_100 @object.pace_100
json.t1 @object.t1
json.bike @object.bike
json.mph @object.mph
json.t2 @object.t2
json.run @object.run
json.mmile @object.mmile
json.result_url @object.result_url
json.result_url api_race_result_url(result.race.id, result)
if result.racer.id
  json.racer_url api_racer_url(result.racer.id)
end

