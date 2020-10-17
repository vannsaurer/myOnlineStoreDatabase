
--Virginia Saurer 
/*
Query 4.6
Find the the name of the product the customer with customer id 987654321 ordered
along with the order number
*/


select products.pName, orders.orderNum
from orders join customers on (customers.customerID = orders.customerID)
                join products on (products.pNum = orders.pNum)
where customers.customerID = '987654321';


/*
product name ordered | order number
-----------------------------------
When in Paris|204
*/
