DROP TABLE IF EXISTS companies;

CREATE TABLE companies (company_id INT(8) NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY, 
company_name VARCHAR(255), industry VARCHAR(255), job_id INT(8) )
AS 
SELECT
  DISTINCT company as company_name,job_id
FROM jobs GROUP BY company,job_id;

ALTER TABLE `mmc`.`companies` 
ADD INDEX `fk_comp_job_id_idx` (`job_id` ASC) VISIBLE;

ALTER TABLE `mmc`.`companies` 
ADD CONSTRAINT `fk_comp_job_id`
  FOREIGN KEY (`job_id`)
  REFERENCES `mmc`.`jobs` (`job_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
DROP TABLE IF EXISTS industries;

CREATE TABLE industries (industry_id INT(8) NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY, 
industry_name VARCHAR(255), job_id INT(8) )
AS 
SELECT
  DISTINCT industry as industry_name,job_id
FROM companies GROUP BY industry,job_id;

ALTER TABLE `mmc`.`industries` 
ADD INDEX `fk_ind_job_id_idx` (`job_id` ASC) VISIBLE;
;
ALTER TABLE `mmc`.`industries` 
ADD CONSTRAINT `fk_ind_job_id`
  FOREIGN KEY (`job_id`)
  REFERENCES `mmc`.`jobs` (`job_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

