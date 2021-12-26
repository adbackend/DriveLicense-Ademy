--회원테이블 auth 0:탈퇴회원 1:일반회원
CREATE TABLE member(
    member_num    NUMBER          NOT NULL, 
    auth          NUMBER(1,0)     DEFAULT 1 NOT NULL, 
    id            VARCHAR2(20)    NOT NULL unique, 
    CONSTRAINT member_pk PRIMARY KEY (member_num)
)

--회원상세 테이블
CREATE TABLE member_detail(
    passwd        VARCHAR2(30)     NOT NULL, 
    name          VARCHAR2(20)     NOT NULL, 
    phone         VARCHAR2(20)     NOT NULL, 
    email         VARCHAR2(50)     NOT NULL, 
    birth         VARCHAR2(8)             NOT NULL,
    zipcode	  VARCHAR2(10)	   NOT NULL, 
    address1      VARCHAR2(100)    NOT NULL, 
    address2      VARCHAR2(100)    NOT NULL, 
    member_num    NUMBER           NOT NULL, 
    CONSTRAINT member_detail_pk primary key(member_num),
    CONSTRAINT member_detail_fk foreign key(member_num) references member(member_num)
)

--관리자 테이블 auth 1:일반관리자 2:최고관리자(최고관리자만 관리자 추가수정삭제확인 가능)
CREATE TABLE ADMIN(
    admin_num     NUMBER          NOT NULL, 
    admin_id      VARCHAR2(20)    NOT NULL, 
    admin_name    VARCHAR2(20)    NOT NULL, 
    admin_passwd  VARCHAR2(30)	  NOT NULL,
    admin_auth    NUMBER(1,0)     NOT NULL, 
    CONSTRAINT admin_pk PRIMARY KEY (admin_num)
)

--강사 테이블
CREATE TABLE teacher(
    teacher_num        NUMBER           NOT NULL, 
    teacher_name       VARCHAR2(20)     NOT NULL, 
    teacher_phone      VARCHAR2(15)     NOT NULL, 
    teacher_email      VARCHAR2(50)    NOT NULL, 
    teacher_profile    VARCHAR2(150),    
    CONSTRAINT teacher_pk PRIMARY KEY (teacher_num)
)

--공지 테이블
CREATE TABLE notice(
    notice_num    NUMBER           NOT NULL, 
    title         VARCHAR2(100)     NOT NULL, 
    content       CLOB    		   NOT NULL, 
    reg_date      DATE		     DEFAULT SYSDATE NOT NULL, 
    filename      VARCHAR2(150)    NULL, 
    hit		      NUMBER           DEFAULT 0 NOT NULL,
    admin_num     NUMBER           NOT NULL, 
    CONSTRAINT notice_pk PRIMARY KEY (notice_num),
    CONSTRAINT notice_fk foreign key(admin_num) references admin(admin_num)
)

--과정 테이블
CREATE TABLE course(
    course_num      NUMBER          NOT NULL, 
    course_name     VARCHAR2(50)    NOT NULL, 
    teacher_num     NUMBER          NOT NULL, 
    tuition	    NUMBER	    NOT NULL,
    CONSTRAINT course_pk PRIMARY KEY (course_num),
    CONSTRAINT course_fk foreign key(teacher_num) references teacher(teacher_num)
)

--수강 신청 테이블(신청결과 -> 0:접수 1:승인 2:미승인)
CREATE TABLE application(
    app_num         NUMBER    NOT NULL, 
    member_num      NUMBER    NOT NULL, 
    course_num      NUMBER    NOT NULL, 
    app_result 	    NUMBER(1,0) DEFAULT 0 NOT NULL,
    app_date        DATE      DEFAULT SYSDATE NOT NULL,
    CONSTRAINT application_pk PRIMARY KEY (app_num),
    CONSTRAINT application_member_fk foreign key(member_num) references member(member_num),
    CONSTRAINT application_course_fk foreign key(course_num) references course(course_num)
)

--상담 테이블
CREATE TABLE consulting(
    consulting_num     NUMBER          NOT NULL, 
    member_num         NUMBER          NOT NULL, 
    consulting_date    DATE            NOT NULL, 
    consulting_time    VARCHAR2(20)    NOT NULL, 
    con_date	       DATE	       DEFAULT SYSDATE NOT NULL,
    con_state		   NUMBER(1,0) DEFAULT 0 NOT NULL,  --0:접수 1:대기 2:완료
    CONSTRAINT consulting_pk PRIMARY KEY (consulting_num),
    CONSTRAINT consulting_fk foreign key(member_num) references member(member_num)
)

--시퀀스
CREATE SEQUENCE member_seq;
CREATE SEQUENCE admin_seq;
CREATE SEQUENCE teacher_seq;
CREATE SEQUENCE notice_seq;
CREATE SEQUENCE course_seq;
CREATE SEQUENCE Application_seq;
CREATE SEQUENCE consulting_seq;