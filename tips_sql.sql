SELECT * FROM data_analyst_assignment.tips_cleaned;

SELECT COUNT(*) AS total_records
FROM tips;

SELECT
    SUM(total_bill IS NULL) AS total_bill_nulls,
    SUM(tip IS NULL) AS tip_nulls,
    SUM(sex IS NULL) AS sex_nulls,
    SUM(smoker IS NULL) AS smoker_nulls,
    SUM(day IS NULL) AS day_nulls,
    SUM(time IS NULL) AS time_nulls,
    SUM(size IS NULL) AS size_nulls,
    SUM(tip_percentage IS NULL) AS tip_percentage_nulls
FROM tips;


#Query 1 — Which sex gives a higher tip_percentage on weekends?

SELECT
    sex,
    ROUND(AVG(tip_percentage), 2) AS avg_tip_percentage
FROM tips
WHERE day IN ('Sat', 'Sun')
GROUP BY sex
ORDER BY avg_tip_percentage DESC;


#Query 2 - Find the top 3 highest bills where tip_percentage > 20%.

select *
FROM tips
WHERE tip_percentage > 20
ORDER BY total_bill DESC
LIMIT 3;


#Query 3 - Does party size affect tip %?

SELECT
    size AS party_size,
    COUNT(*) AS records,
    ROUND(AVG(tip_percentage), 2) AS avg_tip_percentage
FROM tips
GROUP BY size
ORDER BY size;





