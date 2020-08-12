--drop sequence adno_seq;

create sequence adno_seq
start with 1
increment by 1;

create view v_address
as
select ad.*, adg.groupname from address ad, addressgroup adg
where ad.adgno=adg.adgno;