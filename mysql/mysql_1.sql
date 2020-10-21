# Server - Database - Table

# 1. Create

# 1-1. 데이터 베이스

SHOW DATABASES; # 현재 데이터 베이스 확인 cmd + r 이 실행 명령어


# 생성
CREATE DATABASE test;

# 선택

USE test;

# 현재 데이터 베이스 확인
SELECT DATABASE()


# 1-2. Table ,컬럼명 #RDBMS는 컬럼마다 데이터 타입을 지정해줘야함. 

CREATE TABLE user1(
	user_id INT,
	name VARCHAR(20),
	email VARCHAR(30),
	age INT(3),
	rdate DATE 
) 

# PRIMARY KEY : unique(중복된 데이터가 들어갈 수 없다)와 Notnull(빈 데이터가 들어갈 수 없다)라는 두가지 제약족건이 합쳐진 기능 / AUTO_INCREMENT: 데이터가 없으면 1씩 증가하게끔 숫자로 넣어준다
# DEFAULT 30 은 데이터를 입력하지 않으면 30이 들어간다.
# 유니크만 쓰면 하나의 중복되지 않는 null data는 쓸 수 있음, 그러니까 null data를 없애려면 not null도 함께 써주는 게 좋음
# 타임스탬프는 데이터를 안넣어주면 현재시간이 디폴트값으로 들어가는 데이터, 근데 지금은 현재 시간이 안나올거임, 서버 처음 생성하면 한국시간이 아니라 표준시간이 들어가기 때문

CREATE TABLE user2(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	email VARCHAR(30) UNIQUE NOT NULL,
	age INT(3) DEFAULT 30,
	rdate TIMESTAMP 
) 


# 2. 수정 Alter

# 2-1. 데이터 베이스

SHOW variables like 'character_set_database'
Alter DATABASE test CHARACTER SET = utf8


# 2-2 테이블
# user2라는 테이블에 tmp라는 컬럼을 text 데이터 타입으로 추가
ALTER TABLE user2 ADD tmp TEXT
ALTER TABLE user2 MODIFY COLUMN tmp INT(3)
ALTER TABLE user2 DROP tmp

#지금 중요한건 테스트라는 데이터베이스를 이런 순서로 수정한다는 것

# 3. Drop

# 3-1. 데이터 베이스 삭제
CREATE DATABASE tmp 
DROP DATABASE tmp
SHOW DATABASES

# 3-2. 테이블 (현재 어떤 데이터베이스에 접속해서 실행하고 있는지도 중요, 그 데이터베이스에서 그 테이블이 삭제되는걱임)
DROP TABLE user3
SELECT DATABASE()

# 4. Insert

INSERT INTO user1(user_id, name, email, age, rdate)
VALUE (2,"jin","jin@gmail.com","32",now()),
(3,"peter","peter@gmail.com","33",now()),
(4,"po","po@gmail.com","23",now()),
(5,"andy","andy@gmail.com","17",now()),
(6,"jin","jin@gmail.com","43",now())

# 이거 user 2에는 중복 제약있으니까 안되겠네
# 만약 syntax 에러 잇으면 컴퓨터가 그짓말하는지 내가 그짓말하는지 확인해보셈^^
# INSERT INTO. VALUE 가 함께 쓰이는 것처럼 SELECT (컬럼명) FROM (테이블) 함께 쓰이는 것

# 5. SELECT : 데이터 조회

SELECT user_id, name, age
FROM user1

# *은 모든 컬럼데이터를 다 가져온다는 뜻

SELECT *
FROM user1

# Import from as 할 때 as 가 alias : 별명이라는 뜻 , 이렇게 하면 컬럼이름을 바꿔서 출력 쌉가능
# 데이터 지정한 거에서 또 가져오고, 또 가져오고 그거 뭐라고 별명 붙이고 할 때 유용하게 쓰는 기능
SELECT user_id as "ID", name as "UserName", age as "AGES"
FROM user1

# DISTINCT 중복제거 ( pandas series 중복된 데이터 제거할 때 unique 기능이랑 비슷한 것)
SELECT DISTINCT (name)
FROM user1

# WHERE 조건 검색, 얘는 =를 두개안쓰고 하나 씀
#30세 이상인 사용자를 검색해서 이름의 가짓수를 출력
SELECT COUNT(DISTINCT(name))
FROM user1
WHERE age >= 30

SELECT *
FROM user1
WHERE age >= 20 AND age < 40

# BETWEEN A AND B 이건 이상, 이하임

SELECT *
FROM user1
WHERE age BETWEEN 20 AND 39

# ORDER BY 정렬
SELECT *
FROM user1
ORDER BY name, age DESC


# 나이가 20세에서 40세 사이에 있는 사용자를 이름순으로 정렬학꼬 중복데이터를 제거해서 출력

SELECT DISTINCT(NAME)
FROM user1
WHERE age BETWEEN 20 AND 39
ORDER BY name DESC
#order가 맨 뒤로 들어가야하구나
