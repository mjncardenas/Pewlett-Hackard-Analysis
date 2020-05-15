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