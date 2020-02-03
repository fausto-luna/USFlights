1- Cantidad de registros de la tabla Flights.

SELECT COUNT(*) AS total FROM `Flights`

2- Retraso promedio de salida y llegada segun aeropuerto de origen.

SELECT Origin,
AVG(ArrDelay) AS 'prom_arribades',
AVG(DepDelay) AS 'prom_sortides'
FROM Flights
GROUP BY Origin

3- Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport
origen

SELECT Origin, colyear, colmonth,
AVG(ArrDelay) AS 'prom_arribades'
FROM Flights
GROUP BY Origin, colYear, colMonth
ORDER BY Origin, colYear, colMonth

4- Retard promig d’arribada dels vols, per mesos, anys i segons
l’aeroport origen (mateixa consulta que abans i amb el mateix ordre).
Però a més, ara volen que en comptes del codi de l’aeroport es mostri
el nom de la ciutat

SELECT USAirports.City, colyear, colmonth, AVG(ArrDelay) AS 'prom_arribades'
FROM Flights
LEFT JOIN USAirports ON USAirports.IATA=Flights.Origin
GROUP BY USAirports.City, Flights.colYear, Flights.colMonth
ORDER by USAirports.City, Flights.colYear, Flights.colMonth

5-Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar
ordenades de forma que les companyies amb més cancel·lacions apareguin
les primeres.

SELECT `UniqueCarrier`, colYear, colMonth, SUM(`Cancelled`) as 'total_cancelled'
FROM `Flights`
GROUP BY Cancelled, colMonth, colyear
ORDER BY `total_cancelled` DESC

6-L’identificador dels 10 avions que més distància han recorregut fent vols.

SELECT TailNum, SUM(Distance) as 'totalDistance'
FROM `Flights` WHERE TailNum!='' 
GROUP BY TailNum
ORDER BY `totalDistance` DESC

7-Companyies amb el seu retard promig només d’aquelles les quals els seus
vols arriben al seu destí amb un retràs promig major de 10 minuts.

SELECT UniqueCarrier, AVG(ArrDelay) AS avgDelay
FROM Flights
GROUP BY UniqueCarrier HAVING AVG(ArrDelay) > 10
ORDER BY AvgDelay DESC
