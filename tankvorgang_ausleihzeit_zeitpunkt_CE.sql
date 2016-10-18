SELECT *, (zeitpunkt_tankvorgang + (auslehzeit/2)) as berechneter_tankvorgangzeitpunkt,
EXTRACT( hour from (zeitpunkt_tankvorgang + (auslehzeit/2))) as tankzeitpunkt_h
FROM tankvorgang_ausleihzeit_ce 
LIMIT 100