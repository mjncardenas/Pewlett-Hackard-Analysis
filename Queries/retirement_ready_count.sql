SELECT COUNT(ti.title), ce.emp_no
INTO count_title
FROM current_emp as ce
	INNER JOIN titles as ti
		ON (ce.emp_no = ti.emp_no)
GROUP BY ce.emp_no 
ORDER BY ce.emp_no;





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