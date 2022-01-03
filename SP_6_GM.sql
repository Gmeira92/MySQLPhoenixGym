use phoenixgym;
create view summarizes_data as
select m.membership_id,first_name, last_name, sum(billing_amount) as total_bill, 
min(billing_date) as earlier_invoices, count(*) as invoices
from members m join invoices i
on m.membership_id = i.membership_id
group by first_name, last_name, membership_id;

select * from summarizes_data 

/* sum average min max count in the view 3 of them */
