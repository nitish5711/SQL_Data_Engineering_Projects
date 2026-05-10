SELECT
      *
FROM
    company_dim
LIMIT 10;

SELECT *
FROM 
    skills_dim
LIMIT 5;

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'data_jobs';

SELECT *
FROM information_schema.columns
WHERE table_catalog = 'data_jobs';

SELECT *
FROM information_schema.table_constraints
WHERE table_catalog = 'data_jobs';

PRAGMA show_tables;

PRAGMA show_tables_expanded;

DESCRIBE job_postings_fact;