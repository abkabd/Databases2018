create database lab10;

create user2 password 'kbtu';
create tables students(id integer, name varchar(30));
select into students values(23, 'Askar'), (12, 'Timur');
grant select, update, insert on students to user2;

--user1
begin transaction isolation level serializable;
insert into students values(1, 'Alibek'),(2, 'Aibek');
update students set id=id+1 where name='Aibek';
commit;

--user2
begin transaction isolation level repeatable read;
insert into students values(4, 'Iskander'),(5, 'Roman');
delete from students where name='Askar';
commit;

--user1
begin transaction isolation level read committed
delete from students where id=12;
update students set id=id+8 where name='Askar';
commit;

--user2
begin transaction isolation level serializable;
insert into students values(7, 'Aliya'),(8, 'Tommy');
update students set id=id+1 where name='Askar';
commit;