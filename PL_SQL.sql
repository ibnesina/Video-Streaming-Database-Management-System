--PL/SQL

--PL/SQL Variable Declaration and Print value (Print the user whose user_id = 4)
set SERVEROUTPUT on
declare
user_id users.user_id%type;
user_name users.user_name%type;
user_email users.user_email%type;
user_gender users.user_gender%type;
user_birthday users.user_birthday%type;
user_country users.user_country%type;

begin
  select user_id,user_name,user_email,user_gender,user_birthday,user_country
  into user_id,user_name,user_email,user_gender,user_birthday,user_country from users
  where user_id = 4;
  dbms_output.put_line('user_id : '||user_id||', user_name: '||user_name||', user_email: '||user_email||', user_gender: '||user_gender||', user_birthday: '||user_birthday||', user_country: '||user_country);
end;
/

--Row Type (Print the user whose user_id = 4)
set serveroutput on
declare
user_row users%ROWTYPE;
begin
  select user_id,user_name,user_email,user_gender,user_birthday,user_country
  into user_row.user_id,user_row.user_name,user_row.user_email,user_row.user_gender,user_row.user_birthday,user_row.user_country from users
  where user_id = 4;
  dbms_output.put_line('user_id : '||user_row.user_id||', user_name: '||user_row.user_name||', user_email: '||user_row.user_email||', user_gender: '||user_row.user_gender||', user_birthday: '||user_row.user_birthday||', user_country: '||user_row.user_country);
end;
/

--Insert and set default value
set serveroutput on
declare
user_id users.user_id%type:=5;
user_name users.user_name%type:='Hasib';
user_email users.user_email%type:='hasib@gmail.com';
user_gender users.user_gender%type:='Male';
user_birthday users.user_birthday%type:=DATE'1990-05-15';
user_country users.user_country%type:='Bangladesh';
users_religion users.users_religion%type:='Islam';
begin
  insert into users values(user_id,user_name,user_email,user_gender,user_birthday,user_country,users_religion);
end;
/
select * from users;

--Cursor and row count
set serveroutput on
declare
cursor dc is select * from users;
user_row users%ROWTYPE;
begin
  open dc;
  fetch dc into user_row.user_id,user_row.user_name,user_row.user_email,user_row.user_gender,
  user_row.user_birthday,user_row.user_country, user_row.users_religion;
  while dc%found 
  loop
    dbms_output.put_line('user_id : '||user_row.user_id||', user_name: '||user_row.user_name||', user_email: '||user_row.user_email||', user_gender: '||user_row.user_gender||', user_birthday: '||user_row.user_birthday||', user_country: '||user_row.user_country);
    dbms_output.put_line('Row count: '|| dc%rowcount);
    fetch dc into user_row.user_id,user_row.user_name,user_row.user_email,user_row.user_gender,
  user_row.user_birthday,user_row.user_country, user_row.users_religion;
  end loop;
  close dc;
end;
/


--FOR LOOP/WHILE LOOP/ARRAY with extend() function (Store the user name in an Array and Print them)
set serveroutput on
declare
counter number;
user_name2 users.user_name%type;
type namearray is varray(5) of users.user_name%type;
u_name namearray:=namearray();
begin
  counter:=1;
  for i in 1..5
  loop
    select user_name into user_name2 from users where user_id=i;
    u_name.extend();
    u_name(counter) := user_name2;
    counter:=counter+1;
  end loop;
  counter:=1;
  while counter<=u_name.count
  loop
    dbms_output.put_line(u_name(counter));
    counter:=counter+1;
  end loop;
end;
/

--ARRAY without extend() function (Store the user name in an Array and Print them)
set serveroutput on
declare
counter number;
user_name2 users.user_name%type;
type namearray is varray(5) of users.user_name%type;
u_name namearray:=namearray('name1', 'name2', 'name3', 'name4', 'name5');
begin
  counter:=1;
  for i in 1..5
  loop
    select user_name into user_name2 from users where user_id=i;
    u_name(counter) := user_name2;
    counter:=counter+1;
  end loop;
  counter:=1;
  while counter<=u_name.count
  loop
    dbms_output.put_line(u_name(counter));
    counter:=counter+1;
  end loop;
end;

--IF /ELSEIF /ELSE (Check if the video is short, medium or long video)
set serveroutput on
declare 
vd video.video_duration%type;
begin
  for i in 1..5
  loop
    select video_duration into vd from video where video_id=i;
    if vd<=300 then
        dbms_output.put_line('Short Video');
    elsif vd>300 and vd<500 then
        dbms_output.put_line('Medium Video');
    else
        dbms_output.put_line('Long Video');
    end if;   
  end loop;
end;
/

--Procedure (Find User Name by User ID)
create or replace procedure proc(
    var1 in number,
    var2 out varchar2
)
as
t_show char(30);
begin
  t_show := 'User Name : ';
  select user_name into var2 from users where user_id=var1;
  dbms_output.put_line(t_show||var2);
end;
/

set serveroutput on
declare 
user_id users.user_id%type:=5;
user_name users.user_name%type;
begin
  proc(user_id, user_name);
end;
/

--Function (Return User Name from User ID)
set serveroutput on
create or replace function func(var1 in number) return varchar
as value users.user_name%type;
begin
  select user_name into value from users where user_id=var1;
  return value;
end;
/

set serveroutput on
declare 
user_id users.user_id%type:=5;
user_name users.user_name%type;
begin
  user_name:=func(user_id);
  dbms_output.put_line(user_name);
end;
/
