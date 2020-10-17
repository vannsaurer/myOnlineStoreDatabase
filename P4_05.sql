--Virginia Saurer
/*
Query 4.5
Find the number of orders a customer with customer id number 123456789 made.
*/


select count(orders.customerID) as dup_count
from orders
where orders.customerID = '123456789';



/*Test Output
number of orders that customer 123456789 made
---------------------------------------------
1
*/
