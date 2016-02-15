json.ignore_nil!

if !result.o.nil?
  json.place result.o.place
end
json.time format_hours(result.secs.to_i)
json.last_name result.last_name
json.first_name result.first_name
json.bib result.bib
json.city result.city
json.state result.state
json.gender result.racer_gender
json.gender_place result.gender_place
json.group result.group_name
json.group_place result.group_place
json.swim format_hours(result.swim_secs.to_i)
json.pace_100 format_minutes(result.swim_pace_100.to_i)
json.t1 format_minutes(result.t1_secs.to_i)
json.bike format_hours(result.bike_secs.to_i)
json.mph  format_mph result.bike_mph.to_f.round(1) 
json.t2 format_minutes result.t2_secs.to_i
json.run format_hours result.run_secs.to_i
json.mmile format_minutes result.run_mmile.to_i
json.result_url api_race_result_url( result.race.id, result)
if result.racer.id
  json.racer_url api_racer_url(result.racer.id)
end
