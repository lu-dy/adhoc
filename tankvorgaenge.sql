

SELECT display_name, town_id, wochentag, stunde, enginetype,count(*)as gesamtanzahl_wochentag,
 (count(*)/6) as Anzahl_tankvorgaenge_tag, avg(diff) 

FROM tanked_20160920_car2go join town ON town.id = town_id
GROUP BY town_id,display_name, wochentag, stunde,  enginetype
ORDER BY enginetype, town_id,wochentag, stunde

