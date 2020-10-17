--Virginia Saurer

/*
Query 4.8
List the customer names with the number of products each customer ordered.
*/


select customers.name, count (orders.pNum)
from customers, orders
where customers.customerID = orders.customerID
group by customers.name;


/*Test Output
customer names | number of products each customer ordered
----------------------------------------------------
Alicia Zelaya|1
Franklin Wong|1
Jennifer Wallace|1
John Smith|1
*/
