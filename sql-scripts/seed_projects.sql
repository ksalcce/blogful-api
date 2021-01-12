-- TRUNCATE all tables to ensure that there are no
-- data in them so we start with a fresh set of data
TRUNCATE department, employee, employee_project, project RESTART IDENTITY CASCADE;

-- insert 4 projects
INSERT INTO project
  (project_name, budget, start_date)
  VALUES
    ('Build Database', 20000, '3/4/2019'),
    ('Plan christmas party', 500, '11/20/2019'),
    ('Remove old stock', 1000, '4/6/2019'),
    ('Watch paint dry', 3000, '2/11/2019');

-- insert 4 departments
INSERT INTO department
  (dept_name)
  VALUES
    ('Development'),
    ('Sales'),
    ('Human Resources'),
    ('Warehouse');

-- insert some employees
INSERT INTO employee
  (emp_name, phone, title, salary, department)
  VALUES
    ('Michael Scott', '5551234', 'Regional Manager', 80000, 2),
    ('Dwight Schrute', '5554321', 'Assistant to Regional Manager', 30000, 2),
    ('Jim Halpert', '5555678', 'Salesman', 50000, 2),
    ('Pam Beasley', '5558765', 'Secretary', 35000, 2) ,
    ('Meredith Palmer', '5559876', 'Supplier Relations', 30000, 4),
    ('Toby Flenderson', '5558769', 'Head Human Resources', 60000, 3),
    ('Edgar Djikstra', '5554567', 'Lead Software Developer', 120000, 1);

-- Add managers to the departments
UPDATE department SET manager = 7 WHERE id = 1;
UPDATE department SET manager = 3 WHERE id = 2;
UPDATE department SET manager = 6 WHERE id = 3;
UPDATE department SET manager = 5 WHERE id = 4;

-- put employees on projects
INSERT INTO employee_project
  (emp_id, project_id, start_date, end_date)
  VALUES
    (7, 1, '3/4/2019', '6/1/2019'),
    (6, 2, '11/20/2019', '12/25/2019'),
    (5, 3, '4/6/2019', '4/12/2019'),
    (4, 4, '2/11/2019', '2/15/2019'),
    (3, 4, '2/25/2019', '3/15/2019'),
    (2, 4, '2/11/2019', '2/25/2019'),
    (1, 4, '2/15/2019', '4/12/2019');




SELECT
  e.emp_name as Full_Name,
  p.project_name as project
FROM
  p.project_name
  INNER JOIN
  employee e
  ON e.emp_name = e.id
WHERE
  p.project_name = 'Plan christmas party';

  SELECT
  e.emp_name as Full_Name,
  p.project_name as project
FROM
  employee e
  JOIN
  employee_project ep
  ON e.id = ep.emp_id
  JOIN
  project p
  ON ep.project_id = p.id
  WHERE
  p.project_name = 'Plan christmas party';

  List the names of employees from 
  the Warehouse department that are assigned 
  to the 'Watch paint dry' project.

 SELECT
  e.emp_name as Full_Name,
  p.project_name as project
FROM
  employee e
  JOIN
  employee_project ep
  ON e.id = ep.emp_id
  JOIN
  project p
  ON ep.project_id = p.id
WHERE
  p.project_name = 'Watch paint dry';

   d.dept_name = 'Warehouse'

   Which projects are the 
   Sales department 
   employees assigned to?

SELECT
  d.dept_name as Department,
  p.project_name as project,
  e.emp_name as Full_Name
FROM
  department d
  project p
  INNER JOIN
  employee e
  ON e.department = d.id
WHERE
  d.dept_name = 'Sales';

  SELECT
  e.emp_name as Full_Name,
  e.salary as Salary,
  d.dept_name as Department
FROM
  employee e
  INNER JOIN
  department d
  ON e.department = d.id
  WHERE
  d.dept_name = 'Sales';

 SELECT
  e.emp_name as Manager_Name,
  p.project_name as project,
  d.dept_name as Department
FROM
  employee e
  JOIN
  employee_project ep
  ON e.id = ep.emp_id
  JOIN
  project p
  ON ep.project_id = p.id
  JOIN
  department d
  ON e.department = d.id
  WHERE
  p.project_name = 'Watch paint dry'; 

  SELECT
  d.id,
  d.dept_name as department,
  e.emp_name as Manager_Name
FROM
  department d
  JOIN
  project p
  ON 
  ep.project_id = p.id
  INNER JOIN
  employee e
  ON
    d.manager = e.id
    WHERE
  p.project_name = 'Watch paint dry';
