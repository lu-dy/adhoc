CREATE TABLE tankvorgaenge_bis_20161011_pro_wt_stunde_DE_CE as
SELECT wochentag, stunde, count(*) as Anzahl_Tankvorgang

FROM 

(SELECT 
  id ,
  company ,
  town_id ,
  carident,
  seen_at,
  pos,
  enginetype,
  vin,
  seen_at::date  as datum,
  EXTRACT(DOW FROM seen_at)as wochentag, 
  EXTRACT(hour from seen_at) as stunde,
  seen_at::time as Uhrzeit,
  lead(seen_at) OVER (PARTITION BY carident ORDER BY seen_at) as Uhrzeit_next,  	
	fuellevel, 
	lead(fuellevel) OVER (PARTITION BY carident ORDER BY seen_at) as fuel_next,
	fuellevel - lead(fuellevel) OVER (PARTITION BY carident ORDER BY seen_at) as diff
FROM observation ) as d
WHERE diff < 0 and town_id IN (9,10,11,12,18,19,33,34,2) and enginetype = 'CE'
GROUP BY wochentag ,stunde
ORDER BY wochentag, stunde
