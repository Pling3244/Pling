create table uc_cate(
    tier number(1) not null,
    cateName varchar2(30) not null,
    cateCode varchar2(30) not null,
    cateParent varchar2(30),
    primary key(cateCode),
    foreign key(cateParent) references uc_cate(cateCode) 
);

insert into uc_cate(tier, cateName, cateCode) values (1, '현대', '100000');
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '아반떼', '101000','100000');            
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '그랜저', '102000','100000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '제네시스', '103000','100000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '스타렉스', '104000','100000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '포터', '105000','100000');
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '기타', '199000','100000');
insert into uc_cate(tier, cateName, cateCode) values (1, '기아', '200000');
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, 'K3', '201000','200000');            
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, 'K5', '202000','200000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, 'K7', '203000','200000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, 'K9', '204000','200000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '모닝', '205000','200000');
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '기타', '299000','200000');
insert into uc_cate(tier, cateName, cateCode) values (1, '한국GM', '300000');
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '쉐보레 스파크', '301000','300000');            
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '쉐보레 크루즈', '302000','300000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '쉐보레 올란도', '303000','300000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '쉐보레 말리부', '304000','300000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '기타', '399000','300000');
insert into uc_cate(tier, cateName, cateCode) values (1, 'KG모빌리티', '400000');
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '코란도', '401000','400000');            
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '티볼리', '402000','400000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '렉스턴', '403000','400000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '액티언', '404000','400000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '체어맨', '405000','400000');
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '기타', '499000','400000');
insert into uc_cate(tier, cateName, cateCode) values (1, '르노코리아', '500000');
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, 'SM3', '501000','500000');            
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, 'SM5', '502000','500000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, 'SM7', '503000','500000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, 'QM6', '504000','500000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '기타', '599000','500000');
insert into uc_cate(tier, cateName, cateCode) values (1, '기타', '2000000');
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '굴삭기', '2001000','2000000');            
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '버스', '2002000','2000000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '전기차', '2003000','2000000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '트럭', '2004000','2000000');               
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '트레일러', '2005000','2000000');
    insert into uc_cate(tier, cateName, cateCode, cateParent) values (2, '기타', '2099000','2000000');
    

alter table uc_car add foreign key (cop_name) references uc_cate(cateCode);
alter table uc_car add foreign key (br_name) references uc_cate(cateCode);