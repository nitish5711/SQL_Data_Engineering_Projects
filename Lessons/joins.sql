-- LEFT JOIN
SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf

LEFT JOIN company_dim AS cd
ON jpf.company_id = cd.company_id
LIMIT 10;

-- Total no. of rows in jpf

SELECT
      COUNT(*)
FROM job_postings_fact;

-- RIGHT JOIN
SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf

RIGHT JOIN company_dim AS cd
ON jpf.company_id = cd.company_id
LIMIT 10;


-- INNER JOIN
SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf

INNER JOIN company_dim AS cd
ON jpf.company_id = cd.company_id
LIMIT 10;

-- FULL OUTER JOIN
SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf

FULL OUTER JOIN company_dim AS cd
ON jpf.company_id = cd.company_id
LIMIT 10;


SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM
    job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd
ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd
ON sjd.skill_id = sd.skill_id
LIMIT 10;


EXPLAIN SELECT
     cd.name AS company_name,
     COUNT(jpf.job_id) AS posting_count
FROM
    job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
ON jpf.company_id = cd.company_id
WHERE
    jpf.job_country = 'United States'
GROUP BY cd.name
HAVING
     COUNT(jpf.job_id) > 3000
ORDER BY 
        COUNT(jpf.job_id) DESC;
