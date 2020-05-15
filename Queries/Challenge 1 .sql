
SELECT ce.emp_no, 
ce.first_name, 
ce.last_name, 
ti.title, 
sa.salary, 
dm.from_date, 
ce.to_date 
INTO retirement_ready
FROM current_emp as ce
	INNER JOIN salaries as sa
		ON (ce.emp_no = sa.emp_no)
	INNER JOIN dept_manager as dm
		ON (sa.from_date = dm.from_date)
	INNER JOIN titles as ti
	ON(ce.emp_no = ti.emp_no)
ORDER BY ce.emp_no; 		

SELECT * FROM retirement_ready;	

SELECT ce.emp_no, 
ce.first_name, 
ce.last_name, 
ce.to_date,
ct.count
INTO retirement_ready_count
FROM count_title as ct
	INNER JOIN current_emp as ce
		ON (ce.emp_no = ct.emp_no)
ORDER BY ce.emp_no; 		

SELECT * FROM retirement_ready_count;
	

-- Partition the data to show only most recent title per employee
SELECT emp_no,
first_name,
last_name,
title,
salary,
from_date,
to_date
INTO ret_ready_partition
FROM
 (SELECT emp_no,
  first_name,
  last_name,
  title,
  salary,
  from_date,
  to_date, ROW_NUMBER() OVER
 (PARTITION BY (emp_no)
 ORDER BY to_date DESC) rn
 FROM retirement_ready
 ) tmp WHERE rn = 1
ORDER BY emp_no;
		
SELECT * FROM ret_ready_partition;
