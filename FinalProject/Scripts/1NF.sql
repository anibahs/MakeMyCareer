GRANT INSERT, UPDATE, DELETE ON *.* TO 'root'@'localhost';

DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs(job_id INT(8) PRIMARY KEY NOT NULL UNIQUE,
 job_title VARCHAR(255), job_description VARCHAR(255), url VARCHAR(255), 
 industry VARCHAR(255), company VARCHAR(255), job_locality VARCHAR(255), 
 job_region VARCHAR(255), skill INT(8), job_post_expiry date,
 education_requirements VARCHAR(255), base_salary_max VARCHAR(255), 
 base_salary_min VARCHAR(255), base_salary_currency VARCHAR(255) );

DROP TABLE IF EXISTS courses;
CREATE TABLE courses(course_id INT(8) PRIMARY KEY NOT NULL UNIQUE, type VARCHAR(255), 
course_title VARCHAR(255), job_description VARCHAR(255),
url VARCHAR(255), ratings VARCHAR(255), recent_views VARCHAR(255), 
enrolled VARCHAR(255), skill INT(8));
                            
DROP TABLE IF EXISTS skills;
CREATE TABLE skills(skill_id INT(8) PRIMARY KEY NOT NULL UNIQUE, skill_name VARCHAR(255));

DROP TABLE IF EXISTS locations;
CREATE TABLE locations(locality_id INT(8) PRIMARY KEY NOT NULL UNIQUE,
locality VARCHAR(255), region VARCHAR(255), job_id INT(8));
                            
DROP TABLE IF EXISTS companies;
CREATE TABLE companies(company_id INT(8) PRIMARY KEY NOT NULL UNIQUE,
company_name VARCHAR(255), industry VARCHAR(255), job_id INT(8));

DROP TABLE IF EXISTS industries;
CREATE TABLE industries(industry_id INT(8) PRIMARY KEY NOT NULL UNIQUE,
company_name VARCHAR(255), industry VARCHAR(255), job_id INT(8));

CREATE INDEX ON  jobs (job_id);

ALTER TABLE jobs ADD CONSTRAINT fk_skill_id FOREIGN KEY (skill_id) REFERENCES skills(skill_id);
ALTER TABLE courses ADD CONSTRAINT fk_skill_id FOREIGN KEY (skills) REFERENCES skills(skill_id);
ALTER TABLE locations ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs(job_id);
                            

ALTER TABLE `mmc`.`jobs` 
ADD CONSTRAINT `fk_skill_id`
  FOREIGN KEY (`skill_id`)
  REFERENCES `mmc`.`skills` (`skill_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `mmc`.`skills` 
ADD CONSTRAINT `fk_job_id`
  FOREIGN KEY (`job_id`)
  REFERENCES `mmc`.`jobs` (`job_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;  

  
ALTER TABLE `mmc`.`courses` 
ADD INDEX `fk_cskill_id_idx` (`skills` ASC) VISIBLE;
;
ALTER TABLE `mmc`.`courses` 
ADD CONSTRAINT `fk_c_skill_id`
  FOREIGN KEY (`skills`)
  REFERENCES `mmc`.`skills` (`skill_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
                
                            
