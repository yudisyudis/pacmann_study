SELECT *
FROM customers
FULL JOIN payments
-- ON customers.id_customer = payments.id_customer

SELECT id_customer, tgl_transaksi, jumlah_pembayaran
FROM payments
WHERE jumlah_pembayaran > (SELECT AVG(jumlah_pembayaran) FROM payments)

SELECT MIN(jumlah_pembayaran) AS transaksi_min
FROM (SELECT id_customer, tgl_transaksi, jumlah_pembayaran
		FROM payments
		WHERE jumlah_pembayaran > (SELECT AVG(jumlah_pembayaran) FROM payments))AS transaksi_diatas_rata

WITH total_transaksi AS(
	SELECT payments.id_customer, SUM(jumlah_pembayaran) as total_pembayaran
	FROM payments
    JOIN customers2
		ON payments.id_customer = customers2.id_customer
    GROUP BY id_customer
)
SELECT nama_customer, email, total_pembayaran
FROM total_transaksi
JOIN customers2
	ON total_transaksi.id_customer = customers2.id_customer
WHERE total_pembayaran < (SELECT AVG(total_pembayaran)FROM total_transaksi)

CREATE TEMPORARY TABLE total_transaksi
SELECT payments.id_customer, SUM(jumlah_pembayaran) as total_pembayaran
FROM payments
JOIN customers2
	ON payments.id_customer = customers2.id_customer
GROUP BY id_customer;

CREATE TEMPORARY TABLE rerata_transaksi
SELECT AVG(total_pembayaran) FROM total_transaksi;

SELECT nama_customer, email, total_pembayaran
FROM total_transaksi
JOIN customers2
	ON total_transaksi.id_customer = customers2.id_customer
WHERE total_pembayaran > (SELECT *FROM rerata_transaksi)

SELECT nama_customer, email, total_pembayaran
FROM total_transaksi
JOIN customers2
	ON total_transaksi.id_customer = customers2.id_customer
WHERE total_pembayaran < (SELECT * FROM rerata_transaksi)
