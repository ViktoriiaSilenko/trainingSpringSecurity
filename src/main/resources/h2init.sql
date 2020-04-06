
drop table if exists authorities;
drop table if exists users;

create table users (
    username        varchar(50) not null primary key,
    password        varchar(50) not null,
    enabled         boolean not null
) engine = InnoDb;


create table authorities (
    username        varchar(50) not null,
    authority       varchar(50) not null,
    foreign key (username) references users (username),
    unique index authorities_idx_1 (username, authority)
) engine = InnoDb;


drop table if exists acl_entry;
drop table if exists acl_object_identity;
drop table if exists acl_class;
drop table if exists acl_sid;

create table acl_sid (
    id                      bigint unsigned not null auto_increment primary key,
    principal               tinyint(1) not null,
    sid                     varchar(100) not null,

    unique index acl_sid_idx_1 (sid, principal)
);


create table acl_class (
    id                      bigint unsigned not null auto_increment primary key,
    class                   varchar(100) unique not null
);


create table acl_object_identity (
    id                      bigint unsigned not null auto_increment primary key,
    object_id_class         bigint unsigned not null,
    object_id_identity      bigint unsigned not null,
    parent_object           bigint unsigned,
    owner_sid               bigint unsigned,
    entries_inheriting      tinyint(1) not null,

    unique index acl_object_identity_idx_1 (object_id_class, object_id_identity),
    foreign key (object_id_class) references acl_class (id),
    foreign key (parent_object) references acl_object_identity (id),
    foreign key (owner_sid) references acl_sid (id)
);


create table acl_entry (
    id                      bigint unsigned not null auto_increment primary key,
    acl_object_identity     bigint unsigned not null,
    ace_order               int unsigned not null,
    sid                     bigint unsigned not null,
    mask                    int not null,
    granting                tinyint(1) not null,
    audit_success           tinyint(1) not null,
    audit_failure           tinyint(1) not null,

    unique index acl_entry_idx_1 (acl_object_identity, ace_order),
    foreign key (acl_object_identity) references acl_object_identity (id),
    foreign key (sid) references acl_sid (id)
);


insert into users values('fin_user_1', '12345678', 1);
insert into authorities values('fin_user_1', 'ROLE_FIN_USER');
insert into authorities values('fin_user_1', 'ROLE_ADMIN');
insert into authorities values('fin_user_1', 'ROLE_ACL_ADMIN');

insert into users values('fin_user_2', '12345678', 1);
insert into authorities values('fin_user_2', 'ROLE_FIN_USER');
insert into authorities values('fin_user_2', 'ROLE_ADMIN');
insert into authorities values('fin_user_2', 'ROLE_ACL_ADMIN');

insert into users values('it_user_1', 'qqq', 1);
insert into authorities values('it_user_1', 'ROLE_IT_USER');
insert into authorities values('it_user_1', 'ROLE_ADMIN');
insert into authorities values('it_user_1', 'ROLE_ACL_ADMIN');
