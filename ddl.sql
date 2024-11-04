drop table hospitalization;
drop table protector;
drop table goinghospital;
drop table treat;
drop table operate;
drop table prescribe;
drop table patient;
drop table hdepartment;
drop table nurse;
drop table doctor;
drop table hospital;


create table hospital(
    h_name VARCHAR2(20) not null PRIMARY key,
    h_location varchar2(50) not null,
    h_head varchar2(20) not null
);

create table hdepartment(
    h_name varchar(20) not null,
    h_dept varchar(20) not null,
    CONSTRAINT pk_dept primary key(h_name,h_dept),
    constraint fk_dept FOREIGN key (h_name) REFERENCES hospital(h_name)
);

create table nurse (
    n_id NUMBER(6) not null,
    n_name varchar2(10) not null,
    n_dept varchar2(20) not null,
    h_name varchar2(20) not null,
    workTime varchar(10) not null,
    constraint pk_nurse PRIMARY key (n_id),
    constraint fk_nurse FOREIGN key(h_name) REFERENCES hospital(h_name)
);

create table doctor(
    d_id NUMBER(6) not null,
    d_name varchar2(10) not null,
    d_dept varchar2(20) not null,
    d_room number not null,
    d_dayoff varchar2(10) not null,
    h_name varchar2(20) not null,
    constraint fk_doctor FOREIGN key(h_name) REFERENCES hospital(h_name),
    constraint pk_doctor PRIMARY key (d_id)
);

create table patient(
    p_id char(14) not null,
    p_name varchar2(10) not null,
    p_doctor NUMBER(6) null,
    p_nurse NUMBER(6) null,
    constraint pk_patient primary key (p_id),
    constraint fk_patient1 foreign key (p_doctor) references doctor(d_id),
    constraint fk_patient2 foreign key (p_nurse) references nurse(n_id)
);

create table protector (
    p_id char(14) not null,
    p_name varchar2(10) not null,
    relationship varchar2(10) not null,
    constraint pk_protector1 primary key (p_name,p_id),
    constraint fk_protector2 foreign key (p_id) references patient(p_id)
);

create table hospitalization(
    h_name varchar2(20) not null,
    p_id char(14) not null,
    enter_date date not null,
    out_date date not null,
    constraint pk_hospitalization primary key (h_name,p_id),
    constraint fk_id foreign key (p_id) references patient(p_id),
    constraint fk_hName foreign key (h_name) references hospital(h_name)
);

create table goinghospital(
    h_name varchar2(20) not null,
    p_id char(14) not null,
    constraint pk_goinghospital primary key (h_name,p_id),
    constraint fk_p_id foreign key (p_id) references patient(p_id),
    constraint fk_goingHospital_name foreign key (h_name) references hospital(h_name)
);

CREATE TABLE treat ( 
	d_id	NUMBER(6),
	p_id	char(14),
	t_date	DATE	NOT NULL,
	CONSTRAINT t_pk	PRIMARY KEY (d_id, p_id),
	CONSTRAINT d_id_fk	FOREIGN KEY (d_id)	REFERENCES doctor(d_id),
	CONSTRAINT p_id_fk	FOREIGN KEY (p_id)	REFERENCES patient(p_id)
);

CREATE TABLE operate (
	d_id	NUMBER(6),
	p_id	char(14),
	o_date	DATE	NOT NULL,
	o_room	NUMBER(4)	NOT NULL,
	CONSTRAINT o_pk	PRIMARY KEY (d_id, p_id),
	CONSTRAINT o_d_id_fk	FOREIGN KEY (d_id)	REFERENCES doctor(d_id),
	CONSTRAINT o_p_id_fk	FOREIGN KEY (p_id)	REFERENCES patient(p_id)
);

CREATE TABLE prescribe ( 
	d_id	NUMBER(6),
	p_id	char(14),
	pr_number	NUMBER(1)	NOT NULL,
	pr_name	VARCHAR(20)	NOT NULL,
	pr_day		NUMBER(2)	NOT NULL,
	CONSTRAINT pr_pk	PRIMARY KEY (d_id, p_id),
	CONSTRAINT pr_d_id_fk	FOREIGN KEY (d_id)	REFERENCES doctor(d_id),
	CONSTRAINT pr_p_id_fk	FOREIGN KEY (p_id)	REFERENCES patient(p_id)
);

insert into hospital values ('����뺴��','�д�','�ں���');
insert into hospital values ('���ִ뺴��','����','������');
insert into hospital values ('���ϻＺ����','����','���μ�');

insert into doctor values(1111,'�ں���','����',101,'�Ͽ���','����뺴��');
insert into doctor values(1234,'��μ�','�Ҿư�',305,'������','����뺴��');
insert into doctor values(4321,'�����','��οܰ�',601,'������','����뺴��');

insert into doctor values(1231,'������','��οܰ�',107,'������','���ִ뺴��');
insert into doctor values(2424,'������','����',305,'������','���ִ뺴��');
insert into doctor values(9832,'����','�Ҿư�',208,'�����','���ִ뺴��');

insert into doctor values(1212,'���μ�','��οܰ�',102,'�ݿ���','���ϻＺ����');
insert into doctor values(1545,'����','����',603,'ȭ����','���ϻＺ����');
insert into doctor values(1667,'������','�Ҿư�',403,'������','���ϻＺ����');

insert into nurse values(1111,'��̹�','����','����뺴��','Day');
insert into nurse values(2222,'����','��οܰ�','����뺴��','Day');
insert into nurse values(3333,'�ڿ���','�Ҿư�','����뺴��','Night');

insert into nurse values(4444,'ȫ����','����','���ִ뺴��','Day');
insert into nurse values(5555,'��ο�','��οܰ�','���ִ뺴��','Day');
insert into nurse values(6666,'�̼�ȣ','�Ҿư�','���ִ뺴��','Day');

insert into nurse values(7777,'�輱��','��οܰ�','���ϻＺ����','Day');
insert into nurse values(8888,'�ȼ���','�Ҿư�','���ϻＺ����','Night');
insert into nurse values(9999,'�̳���','����','���ϻＺ����','Night');

insert into hdepartment values('����뺴��','����');
insert into hdepartment values('����뺴��','�Ҿư�');
insert into hdepartment values('����뺴��','��οܰ�');

insert into hdepartment values('���ִ뺴��','��οܰ�');
insert into hdepartment values('���ִ뺴��','����');
insert into hdepartment values('���ִ뺴��','�Ҿư�');

insert into hdepartment values('���ϻＺ����','��οܰ�');
insert into hdepartment values('���ϻＺ����','����');
insert into hdepartment values('���ϻＺ����','�Ҿư�');

insert into patient values('010101-3434343','�����',1111,1111);
insert into patient values('991212-1212121','�����', null, null);
insert into patient values('040404-4545454','������', null, null);

insert into patient values('880808-1818181','�Ѻλ�', null, null);
insert into patient values('770707-2727272','����õ', 2424, 4444);
insert into patient values('060606-3636363','������', null, null);

insert into patient values('040404-4848484','������', null, null);
insert into patient values('090909-3939393','�����', null, null);
insert into patient values('660202-1010101','����û', 1667, 8888);

insert into prescribe values(1111,'010101-3434343',2,'��Ľ���',7);
insert into prescribe values(1234,'991212-1212121',1,'������',4);
insert into prescribe values(4321,'040404-4545454',1,'�˷�������',5);

insert into prescribe values(1231,'880808-1818181',3,'��ƾ��',6);
insert into prescribe values(2424,'770707-2727272',2,'��������',15);
insert into prescribe values(9832,'060606-3636363',1,'������',4);

insert into prescribe values(1212,'040404-4848484',1,'��Ľ���',5);
insert into prescribe values(1545,'090909-3939393',1,'��ƾ��',10);
insert into prescribe values(1667,'660202-1010101',2,'��������',7);

insert into operate values(1111,'010101-3434343','2022-03-29',1012); /*�����*/
insert into operate values(2424,'770707-2727272','2022-02-20',2025); /*����õ*/
insert into operate values(1667,'660202-1010101','2022-04-21',4685);/*����û*/

insert into treat values(1111,'010101-3434343','2022-01-01');
insert into treat values(1234,'991212-1212121','2022-03-03');
insert into treat values(4321,'040404-4545454','2022-02-02');

insert into treat values(1231,'880808-1818181','2022-04-01');
insert into treat values(2424,'770707-2727272','2022-05-01');
insert into treat values(9832,'060606-3636363','2022-06-01');

insert into treat values(1212,'040404-4848484','2022-03-05');
insert into treat values(1545,'090909-3939393','2022-01-23');
insert into treat values(1667,'660202-1010101','2022-05-06');

insert into goinghospital values('����뺴��','010101-3434343');
insert into goinghospital values('����뺴��','991212-1212121');
insert into goinghospital values('����뺴��','040404-4545454');

insert into goinghospital values('���ִ뺴��','880808-1818181');
insert into goinghospital values('���ִ뺴��','770707-2727272');
insert into goinghospital values('���ִ뺴��','060606-3636363');

insert into goinghospital values('���ϻＺ����','040404-4848484');
insert into goinghospital values('���ϻＺ����','090909-3939393');
insert into goinghospital values('���ϻＺ����','660202-1010101');

insert into protector values ('010101-3434343','������','��');
insert into protector values ('991212-1212121','������','��');
insert into protector values ('040404-4545454','������','��');

insert into protector values ('880808-1818181','������','�����');
insert into protector values ('770707-2727272','������','�����');
insert into protector values ('060606-3636363','������','�����');

insert into protector values ('040404-4848484','���Ͽ�','����');
insert into protector values ('090909-3939393','������','����');
insert into protector values ('660202-1010101','������','����');

insert into hospitalization values('����뺴��','010101-3434343','2022-03-28','2022-03-30'); /*�����*/
insert into hospitalization values('���ִ뺴��','770707-2727272','2022-02-28','2022-03-15'); /*����õ*/
insert into hospitalization values('���ϻＺ����','660202-1010101','2022-04-20','2022-05-01');/*����û*/
