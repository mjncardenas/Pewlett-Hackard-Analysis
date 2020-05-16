
SELECT em.emp_no, 
em.birth_date,
em.first_name, 
em.last_name,
de.to_date
INTO mentorship
FROM employees as em
	INNER JOIN dept_emp as de
	ON (de.emp_no = em.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01');
SELECT * FROM mentorship;




----Challenge 2---
SELECT men.emp_no,
men.first_name, 
men.last_name,
men.to_date,
sa.from_date,
ti.title
INTO mentorship_2
FROM mentorship as men
	INNER JOIN salaries as sa
		ON (men.emp_no = sa.emp_no)
	INNER JOIN titles as ti
		ON (men.emp_no = ti.emp_no)
ORDER BY men.emp_no;

SELECT * FROM mentorship_2;

--Partitionin challenge 2--
SELECT emp_no,
first_name,
last_name,
title,
from_date,
to_date
INTO mentor_partition
FROM
 (SELECT emp_no,
  first_name,
  last_name,
  title,
  from_date,
  to_date, ROW_NUMBER() OVER
 (PARTITION BY (emp_no)
 ORDER BY to_date DESC) rn
 FROM mentorship_2
 ) tmp WHERE rn = 1
ORDER BY emp_no;
		
SELECT * FROM mentor_partition;
