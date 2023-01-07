
insa 테이블

create table EMPLOYEE(
	EMPCD VARCHAR2(12) primary key, 		--사번코드;
	EMPNAME VARCHAR2(10) , 					--이름
	EMPBIRTHDAY DATE ,						--생일
	EMPPHONENUMBER VARCHAR2(20) ,			--휴대폰번호
	EMPEMERGENCYPHONENUMBER VARCHAR2(20) ,	--비상연락망
	EMPPOSTCODE VARCHAR2(10) ,				--우편번호
	EMPADRESS VARCHAR2(50) ,				--주소
	EMPDETAILADRESS VARCHAR2(40) ,			--상세주소
	EMPEMAIL VARCHAR2(50) ,					--이메일
	EMPEMPLOYDAY DATE						--입사일
);

insa 기본 인서트
insert into employee values(
'A'||LPAD(emp_seq.nextval,5,'0'),
'길동홍',
'1990-10-10',
'01012345678',
'01023456789',
'12345',
'서울시 영등포구 신길3동 226-48',
'201호',
'abcde@naver.com',
to_date('2021-07-07','YYYY-MM-DD')
);