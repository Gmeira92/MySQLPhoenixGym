use phoenixgym;
drop trigger if exists member_info_insert
delimiter // 
create trigger member_info_insert
before insert on members
for each row 
begin 
	set new.state = upper(new.state);
end // 

insert into members value
('14',	'James ',	'Smith',	'6148885566',	'980 Long Road','Phoenix', 'az',	'85669',	'167',	'6.4');


