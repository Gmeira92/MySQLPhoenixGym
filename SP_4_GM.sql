use phoenixgym;
create view members_1 as 
select m.membership_id, first_name, last_name, Credit_Card_Company
from members m join payment_info pi
on m.membership_id = pi.membership_id
where m.membership_id = 1 
and Credit_Card_Company = 'Visa';

select *
from members_1 