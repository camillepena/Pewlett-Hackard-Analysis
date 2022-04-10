

SELECT
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
ti.from_date,
ti.to_date,
ti.title
INTO retirement_titles
FROM employees as em
INNER JOIN titles as ti
	on (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '19-01-01' AND '1965-01-01')


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title

INTO unique_titles
FROM employees AS e
INNER JOIN dept_emp as de
	on (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
	on (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, de.to_date desc;


SELECT DISTINCT ON (e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title

INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp as de
	on (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
	on (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, de.to_date desc;

SELECT * FROM mentorship_eligibilty

-- Unique title count 
SELECT COUNT(re.emp_no), un.title
FROM unique_titles as un
LEFT JOIN retirement_titles as re
ON un.emp_no = re.emp_no
GROUP BY un.title
ORDER BY un.title DESC;

SELECT * FROM unique_titles

