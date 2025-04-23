select * from ITI_SQL.Names.Names

insert into Names.Names (id , F_name , L_name , age , E_mail)
values
(
 100 , 'Mohamed' , 'Soliman' , 25 , 'MohamedSoliman@gmail.com'
)
insert into  Names.Names(id , F_name , L_name)
values (
25 , 'Salma' , 'Ahmed'
)
insert into Names.Names(age, E_mail) 
values (25 , 'Salma@Gmail.com')
Where id = 25  ;

UPDATE Names.Names
SET age = 25, 
    E_mail = 'Salma@Gmail.com'
WHERE id = 25;