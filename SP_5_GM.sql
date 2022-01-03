use phoenixgym; 
create view gym_class_instructors_join_table as
select i.instructor_id, first_name, last_name, gc.class_id, 
concat(class_type, ' ', class_day) as Class 
from gym_classes gc join instructors_class_join ic
on gc.class_id = ic.class_id
join instructors i 
on ic.instructor_id = i.instructor_id
where gc.class_id in (select class_id 
from gym_classes 
where class_day = 'Wednesday'); 


select * from gym_class_instructors_join_table


