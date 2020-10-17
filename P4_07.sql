--Virginia Saurer
/*
Query 4.5
Find the number of units of Cards left of the product number 003
*/


select unitNum
from inventory
where inventory.pNum = 003;


/*Test Output
number of units left of product 003
-----------------------------------
5
*/
