CREATE TABLE zwischentabelle_tankvorgang_zeitraume_EDv2 as
SELECT 
  id ,
  company ,
  town_id ,
  carident  ,
  seen_at ,
  pos ,
  enginetype  ,
  vin  ,
  datum ,
  wochentag  ,
  stunde  ,
  uhrzeit ,
  uhrzeit_next ,
  fuellevel ,
  fuel_next,
  diff,
  lag(diff) OVER (PARTITION BY carident ORDER BY seen_at) as fuelburned,
  lag(uhrzeit_next) OVER (Partition BY carident ORDER BY seen_at) as zeitpunkt_tankvorgang,
  lag(town_id) OVER (Partition BY carident ORDER BY seen_at) as townid_nachher
FROM  zwischntabelle_tankvorgaenge_20161014
WHERE town_id IN (9,10,11,12,18,19,33,34,2)
and enginetype ='ED' and (diff < 0 or diff > 0)
