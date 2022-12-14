CREATE TABLE job AS SELECT * FROM jobs;

CREATE TABLE job_skill AS SELECT job_id,skill_id FROM jobs;

CREATE TABLE job_locality AS (
SELECT job.job_id, locations.location_id FROM job
LEFT JOIN locations ON job.job_id=locations.job_id);

CREATE TABLE job_company AS (
SELECT job.job_id, companies.company_id FROM job
LEFT JOIN companies ON job.job_id=companies.job_id);

CREATE TABLE job_industry AS (
SELECT job.job_id, industries.industry_id FROM job
LEFT JOIN industries ON job.job_id=industries.job_id);

UPDATE job SET
company = (
SELECT company_id FROM companies WHERE jobs.job_id=companies.job_id
);

UPDATE job SET
industry = (
SELECT industry_id FROM industries WHERE jobs.job_id=industries.job_id
);

UPDATE jobs SET
job_locality = (
SELECT location_id FROM locations WHERE jobs.job_id=locations.job_id
);
ALTER TABLE jobs
DROP COLUMN job_region;

DROP TABLE IF EXISTS locality ;
CREATE TABLE locality (locality_id INT(8) NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT, locality_name VARCHAR(255), region VARCHAR(255)) AS (
SELECT DISTINCT job_locality,job_region FROM locations);

CREATE TABLE industry (industry_id INT(8) NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT, industry_name VARCHAR(255)) AS (
SELECT DISTINCT industry_name FROM industries);
SELECT * FROM industry;

CREATE TABLE company (company_id INT(8) NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT, company_name VARCHAR(255)) AS (
SELECT DISTINCT company_name FROM companies);

UPDATE jobs SET company = (SELECT company_id FROM company WHERE company.company_id=jobs.company);
UPDATE jobs SET industry = (SELECT industry_id FROM industry WHERE industry.industry_id=jobs.industry);


ALTER TABLE jobs DROP COLUMN company;
ALTER TABLE jobs DROP COLUMN industry;
ALTER TABLE jobs DROP COLUMN job_locality;
ALTER TABLE jobs DROP COLUMN job_region;


