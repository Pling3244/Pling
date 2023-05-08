create table uc_image(
        num int ,
        fileName varchar2(100) not null,
        uploadPath varchar2(200) not null,
        uuid varchar2(100) not null ,
        primary key (uuid),
        foreign key (num) references uc_car(num)
    );

