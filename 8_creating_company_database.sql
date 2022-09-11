# Creating complex database in sql
# Creating company database
# Creating and populating the information
# Code available here: https://www.mikedane.com/databases/sql/creating-company-database/


DROP TABLE student;


CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT, #supervisor id is a foreign key pointing to another employee
  branch_id INT #branch id is a foreign key 
  
  );
  
  /*
  
  Note: 1) We cannot define the super_id and branch_id as foreign keys until the employe and branch table are created
  
  */
  
  #Create the branch tablle
  
  CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT, 
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
  
  #foreign key mgr_id references the emp_id in he employee table
 ); 
  
  #We can now define the foreign keys in he employee table
  
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

#Now, we can add he client table

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

#Next, create the works_wih table

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

#Create the branch suplier table (similar to works_with table - compoiste key)
CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

#Now, we have all the tables created. Lets insert 


  
  