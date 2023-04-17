-- DROP TABLE IF EXISTS photo;
-- DROP TABLE IF EXISTS attachemnt;
-- DROP TABLE IF EXISTS user_roles;
-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS spring_session;
-- DROP TABLE IF EXISTS spring_session_attributes;

create table if not exists photo (
    id bigint generated by default as identity,
    caption varchar(255),
    username varchar(255),
    primary key (id)
);

create table if not exists attachment (
    id uuid default random_uuid() not null,
    content blob,
    content_type varchar(255),
    filename varchar(255),
    photo_id bigint,
    primary key (id),
    foreign key (photo_id) references photo
);

create table if not exists users (
    username varchar(50) not null,
    password varchar(100) not null,
    phone varchar(12),
    email varchar(100),
    primary key (username)
);

create table if not exists user_roles (
    user_role_id integer generated by default as identity,
    role varchar(255),
    username varchar(255),
    primary key (user_role_id)
);
