create table uc_message(
    no number,
    room int not null,
    send_nick varchar(50) not null,
    recv_nick varchar(50) not null,
    send_time date not null,
    read_time date not null,
    content varchar(1000) not null,
    read_chk int not null,
    constraint send_nick_fk foreign key(send_nick) references uc_member(id)
    on delete cascade,
    constraint recv_nick_fk foreign key(recv_nick) references uc_member(id)
    on delete cascade,
    primary key(no)
);

