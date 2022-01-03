use phoenixgym; /*User Defined funtion*/
drop function if exists gym_udf;
delimiter // 
create function gym_udf
(
jo_id int
)
returns dec(9,2) deterministic

begin 
declare invoice_due dec(9,2); 
select sum(billing_amount)
into invoice_due
from invoices
where join_id = jo_id;

return(invoice_due);
end//

use phoenixgym;
select gym_udf(19) as invoice_due; /* combining the invoice amount based off the join_id called in gym_udf(1)*/
