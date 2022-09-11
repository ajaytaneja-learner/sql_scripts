/**
1) Here we are going to talk about wild cards and the LIKE keyword in sql
2) Wildcards are a way of defining different patterns that we want to matchh specfic pieces of data to
3) Grab data that matches sspecific patterns
/


-- % = any # characters , _ = one character

-- Find any clients who are an LLC

SELECT *
FROM client
WHERE client_name LIKE '%LLC';    
# define a pattern in the quotation mark - just like regex. % means 'any number of characters. Name ends with LLC

-- Find any branch supplier who are in the label business

SELECT*
FROM branch_supplier
WHERE supplier_name LIKE '%LABELS%'  
OR supplier_name LIKE '%LABLES%';


-- Find any employe bor in October

SELECT *
FROM employee
WHERE birth_day LIKE '____-10%';


-- Find any clients who are schools

SELECT *
FROM client
WHERE client_name LIKE '%school%';
