use phoenixgym; /* Stored Procedure */
delimiter //
drop procedure if exists member_invoice_insert//
create procedure member_invoice_insert
(
in join_id int,
in membership_id int,
in billing_date varchar(50),
in billing_amount varchar(50),
in paid_date varchar(50)
)
begin 
declare sql_error tinyint default false;
declare continue handler for sqlexception
	set sql_error = true;

Start transaction;

insert into invoices
values (default, join_id, membership_id,billing_date,billing_amount,paid_date);

if sql_error = false then
commit;
select 'The record was inserted!' as message;
else 
rollback;
select 'An incorrect memeber_id was used - the record was not inserted.' /*inserts a record into invoices table if correct join_id and member_id was used*/
as message;
end if;
end//

use phoenixgym;
call member_invoice_insert(1,1,'2021-12-01','100','2021-12-15'); /* will insert record*/

use phoenixgym;
call member_invoice_insert(1,30,'2021-12-01','100','2021-12-15'); /*error message*/