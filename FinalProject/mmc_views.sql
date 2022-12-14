CREATE VIEW skills_for_job AS (
SELECT skills.skill_id,skills.skill_name,jobs.job_title FROM skills JOIN jobs ON jobs.skill_id=skills.skill_id 
WHERE jobs.job_title='Data Analyst'GROUP BY skills.skill_id);

SELECT * FROM skills_for_job;

CREATE VIEW top_courses_for_job AS (
SELECT courses.course_id, courses.title,courses.type,courses.description,
courses.ratings,courses.recent_views,courses.enrolled,skills.skill_name,jobs.job_title 
FROM courses JOIN (skills JOIN jobs ON jobs.skill_id=skills.skill_id ) ON courses.skills=skills.skill_id 
WHERE jobs.job_title in ('Data Analyst') ORDER BY courses.ratings);

SELECT * FROM top_courses_for_job ;

CREATE VIEW jobs_for_skill AS (
SELECT courses.course_id, courses.title,courses.type,courses.description,
courses.ratings,courses.recent_views,courses.enrolled,skills.skill_name,jobs.job_title
FROM courses JOIN (skills JOIN jobs ON jobs.skill_id=skills.skill_id )
ON courses.skills=skills.skill_id WHERE skills.skill_name in ('ai','python', 'sql')
 GROUP BY skills.skill_name);
 
SELECT * FROM jobs_for_skill;


CREATE VIEW cert_courses_for_skill AS (
SELECT * FROM courses JOIN skills ON courses.skills=skills.skill_id
WHERE skills.skill_name='ai' and type = 'Course');

SELECT * FROM cert_courses_for_skill;

CREATE VIEW courses_for_skill AS (
SELECT * FROM courses JOIN skills ON courses.skills=skills.skill_id 
WHERE skills.skill_name='ai' ORDER BY recent_views DESC);

CREATE VIEW courses_for_skill AS (
SELECT * FROM courses JOIN skills ON courses.skills=skills.skill_id 
WHERE skills.skill_name='ai' ORDER BY recent_views DESC);

SELECT * FROM courses_for_skill LIMIT 1;





