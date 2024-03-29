# -------------------------------- 4일차 ---------------------------------------------- #
# JDBC와 연결할 DB 선언 
drop database if exists sqldb4web; -- 삭제
create database sqldb4web; -- 생성


# 회원번호[자동] 아이디 비밀번호 이름 전화번호를 저장하는 member 테이블 생성
# 테이블과 비슷하게 memberDto 클래스 설계
use sqldb4web; -- 사용한다
# member 테이블 
drop table if exists member;  
create table member(
	mno int not null unique auto_increment , -- 자동부여[ 무조건PK만 가능 ]
    mid varchar(30) not null ,
    mpw varchar(30) not null ,		-- 중복허용 
    mname varchar(30) not null ,    -- 중복허용 
    mphone varchar(13) not null unique , 
    primary key(mno)
);
select*from member;

# 1. 회원가입 [ 테이블에 레코드 삽입 ]
insert into member(mid , mpw . mname , mphone ) values('ezen01' , '1234'  , '이젠' , '031-444-2222') 

# 2. 로그인 [ 테이블에 값 검색(select) ] 
select mid from member; -- mid 필드의 레코드만 검색
select mid , mpw from member; -- mid 와 mpw 필드의 레코드만 검색 
select mid , mpw , mname from member; -- mid 와 mpw 와 mname 필드의 레코드만 겁색 
select*from member; 	-- *[ 모든필드 뜻] 모든필드의 레코드 검색 
# 1. 로그인할때 필요한 필드[ 아이디 , 패스워드 ] 검색 
select mid , mpw from member; # select*from member
# 2. 아이디와 패스워드가 일치한 레코드 검색 
	select mid , mpw from member where mid = 'qwe';  #만약에 mid필드에 'qwe' 문자열에 있는 레코드 검색 
	select mid , mpw from member where mid = 'ezen01'; # 만약에 mid 필드에 'exen01' 문자열이 있는 레코드 검색

# 만약에 mid필드가 'ezen01' 이면서 mpw필드가 '1234' 인 레코드 검색
select mid , mpw from member where mid = 'exen01' and mpw = '1234';
select*from member where mid = 'exen01' and mpw = '1234';
# 자바의 문자열로 변환
select*from member;
 
/*
	1. 테이블의 필드에 해당하는 레코드 겁색 			
	 select 필드명 from 테이블명 					   : 해당 필드의 레코드 검색
	 select 필드명 , 필드명 , 필드명 , 필드명 from 테이블  : 여러개 필드들의 레코드 검색
		select*from 테이블명 						   : 모든 필드{ * ] 의 레코드 검색 
        
	2. 필드에 조건 추가 		[ where 조건절 ]
    select 필드명 				from 테이블명 where 조건 
    select 필드명 , 필드명 , 필드명  from 테이블명 where 조건 
	select *					from 테이블명 where 조건
    
*/

/* --------------------------------------------------------------------------------------------------- */
use sqldb4web; 
/* 1. 테이블의 모든 레코드 검색 */
select * from member;

/* 2. 회원가입 : mno 자동부여 이므로 생략 */
insert into member(mid , mpw , mname , mphone)values( 'ezen02' , '1234' , '이젠' , '010-443-1234' );
# insert into member(mid , mpw , mname , mphone)values( '?' , '?' , '?' , '?' ); 자바로 들어가면 ? 처리한다 무엇이 들어갈지 모르기때문에

/* 3.로그인 : 입력한 값이 존재하는지 검색 */
select*from member where mid = 'ezen02' and mpw = '1234'; # 로그인성공 : 레코드 1개이상 검색되면 
select*from member where mid = 'ezen02' and mpw = '12345'; # 로그인실패 : 레코드 0개 검색되면 

/* 4. 아이디/전화번호 중복체크(유효성검사) : 입력한 값이 존재하는지 검색 */
select*from member where mid = 'ezen02';					-- 조건에 맞는 충족한 레코드의 모든 필드 검색
# select*from member where mid = '?';  -- 자바일 경우
select*from member where phone = '010-443-1234';   			-- 조건에 맞는 충족한 레코드의 모든 필드 검색
# select*from member where phone = '?';   -- 자바일 경우

/* 5. 아이디찾기 / 비밀번호 찾기 : 입력한 값이 레코드 검색 */
select mid from member where mname = '이젠' and mphone = '010-443-1234'; -- 조건에 맞는 충족한 레코드의 아이디 필드만 검색
# select mid from member where mname = ? and mphone = ?; -- 자바일 경우
select mpw from member where mid = 'ezen02' and mphone = '010-443-1234'; -- 조건에 맞는 충족한 레코드의 비밀번호 필드만 검색
# select mpw from member where mid = ? and mphone = ?; -- 자바일 경우

/* 6. 회원수정 : 비밀번호 수정 : pk식별 조건 [pk 필드는 수정 하지 않음 -권장 ] */
update member set mpw = '12345' where mno = 4;	# 4번 회원인 레코드의 비밀번호 수정  

/* 6. 회원수정 : 이름 , 전화번호 수정 : pk식별 조건 [ pk필드는 수정 하지 않음 -권장 ] */
update member set mname = 'ezen' , mphone = '010-1234-1234' where mno = 4; # 4번 회원인 레코드의 
# update member set mname = ? , mphone = ? where mno = ?;

/* 7. 회원탈퇴 : pk식별 조건 */ 
delete from member where mno = 4; -- 4번 회원인 레코드 삭제 
# delete from member where mno = ?;
