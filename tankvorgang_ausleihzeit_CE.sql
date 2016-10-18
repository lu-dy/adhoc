CREATE TABLE tankvorgang_ausleihzeit_CE as
select *, round(EXTRACT(EPOCH from (uhrzeit_next - seen_at))/60) as Ausleihzeit_min, uhrzeit_next - seen_at as Auslehzeit
FROM zwischentabelle_tankvorgang_zeitraume_ce_de
WHERE diff < 0
--LIMIT 1000
