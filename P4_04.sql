--Virginia Saurer
/*
Query 4.4
Find all the customer names of customers who have not ordered anything.

*/


select name
from customers c
where NOT EXISTS
     (select *
      from orders
      where c.customerID = orders.customerID);



/*Test Output
names
-----------------
Virginia Saurer
*/
