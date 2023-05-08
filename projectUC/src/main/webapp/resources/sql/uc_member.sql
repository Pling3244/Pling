CREATE TABLE UC_MEMBER (
    ID VARCHAR2(20) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    M_NAME VARCHAR2(20) NOT NULL,
    GENDER VARCHAR2(10) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL,
    REGION VARCHAR2(20) NOT NULL,
    EMAIL VARCHAR2(40) NOT NULL,
    AUTHOR VARCHAR2(10) NOT NULL,
    REGDATE DATE DEFAULT SYSDATE,
    REPORT_NUM NUMBER(10,0),
    PRIMARY KEY (ID)
);

SELECT * FROM uc_member;

insert into uc_member (id, m_name, gender, phone, region, email, author, report_num)
values ('pling', '김용진', '남', '010-8972-2559', '부산', 'e@e', '관리자', 0);