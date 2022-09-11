/* Notes:
Until now, we have seen the fllowin fundamentals of sql:
1)Datatypes
2)Creating a table
3)Inserting data into a table
4)Deleting rows from a table
5)Some basic queries: Aranging in ascending order, descending oder, ORDER B ql clause
*/

/*Company Database

This comprises of several tables/

1) Employee table
2) Branch table
3) Client table
4) Works_wih table
5) Branch Supplier table

*/

/*

Employee table comrises of:

1)employe_id (primary key)
2)first name
3)last name
4)birth date
5)sex
6)salary

Then, there are 2 secondary keys:
1) super_id (i.e. supervisor id) - id of another employee who is the supervisor of the employee
2) branch_id - bracnch where the employee works
 
Then, there is the branch table which comprises of:

1) branch_id (primary key)
2) branch_name
3) mgr_id (secondary key) - Eac branch has a manager - manager id is going to point to one of the employees in the employe table
4) mgr_start_date


Then, there is the cient table comprising of:

1) client_id (pimary key)  client woks with branch (denoted by branch id)
2) client_name
3) branch_id (foreign key) - denoting the client works with which branch

Then, there is the branch suplier

Important: Branch supplier table has to primary keys: branch_id and supplier_name - componet/composit key

1) branch_id does not unquely identify each row
2) suplier name does not uniquely identify each row
3) Together, branch_id and supplier_name uniquely idenify ach row

Then, there is thee works_with table which identifies the relationship between employees an clients

1) employee works witth a client - employee sells some amount worth product to client
2) Composite key: employee_id and clien_id
*/
