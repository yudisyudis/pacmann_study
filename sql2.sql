paymentsUSE pertemuan_2;

SELECT COUNT(DISTINCT custID),COUNT(amount) AS jumTransaksi, AVG(amount) AS rerata_bayar
FROM payments;

SELECT MIN(Profit) as minProfit, MAX(Profit) as maxProfit
FROM shoes;

SELECT Country, SUM(Medal) as TotalMedal
FROM medals
GROUP BY Country

SELECT Country, Sport, SUM(Medal) as TotalMedal
FROM medals
GROUP BY Country, Sport
HAVING SUM(Medal) > 5;

SELECT Country, Medal, 
AVG(Medal) OVER(PARTITION BY Country ORDER BY Medal DESC
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as AvgMedal
FROM medals;

select Country, Medal,
AVG(Medal) OVER() as avgMedal
from medals;