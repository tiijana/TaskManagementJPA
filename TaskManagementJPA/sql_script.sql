create schema is2 collate utf8mb4_unicode_ci;

create table role
(
	idrole int auto_increment
		primary key,
	name varchar(256) null
)
charset=utf8;

create table user
(
	idUser int auto_increment
		primary key,
	username varchar(256) null,
	password varchar(1024) null,
	name varchar(256) null,
	idRole int null,
	constraint user_role_idrole_fk
		foreign key (idRole) references role (idrole)
)
charset=utf8;

create table project
(
	idProject int auto_increment
		primary key,
	title varchar(256) null,
	description text null,
	idLeader int null,
	constraint project_user_idUser_fk
		foreign key (idLeader) references user (idUser)
)
charset=utf8;

create table picture
(
	idPicture int auto_increment
		primary key,
	path varchar(1024) null,
	picture longblob null,
	idProject int null,
	constraint picture_project_idProject_fk
		foreign key (idProject) references project (idProject)
)
charset=utf8;

create table task
(
	idTask int auto_increment
		primary key,
	description text null,
	startDate timestamp null,
	endDate timestamp null,
	status varchar(256) null,
	idProject int null,
	constraint task_project_idProject_fk
		foreign key (idProject) references project (idProject)
)
charset=utf8;

create table assigned
(
	idAssigned int auto_increment
		primary key,
	idTask int null,
	idUser int null,
	constraint assigned_task_idTask_fkdd
		foreign key (idTask) references task (idTask),
	constraint assigned_user_idUser_fkk
		foreign key (idUser) references user (idUser)
)
charset=utf8;

