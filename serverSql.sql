/*
user table
변경사항
1. userName column => user를 식별할 ID와 같은역할을 해야한다. gmail이 여기에 들어갈듯
2. userNickName => 사용자가 사용할 닉네임.
*/

CREATE TABLE tbUser (
	userId int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	userName char(35) NOT NULL, /*실질적 식별자, 이메일?*/
	userNickName char(30) NOT NULL,/*사용자가 설정할 닉네임*/
	userProfilePhoto char(100), /*url*/
	userLevel float NOT NULL,
	userTitle char(200)
);

ALTER TABLE tbUser ADD CONSTRAINT unique_tbUser_userName UNIQUE(
	userName
);

ALTER TABLE tbUser ADD CONSTRAINT unique_tbUser_userNickName UNIQUE(
	userNickName
);

/*
user_event table
변경사항
1. hostId column 제거 => event에서 host를 식별가능하기때문에 제거했습니다.
2. PK => event_id와 user_id(guestId)
*/
CREATE TABLE tbEventParticipant (
	eventId int NOT NULL,
	guestUserId int NOT NULL
);

ALTER TABLE tbEventParticipant 
ADD CONSTRAINT unique_tbEventParticipant 
PRIMARY KEY (
	eventId,
	guestUserId
);

ALTER TABLE tbEventParticipant 
ADD CONSTRAINT 
fk_tbEventParticipant_guestUserId 
FOREIGN KEY (
	guestUserId	
) REFERENCES tbUser (
	userId
);

ALTER TABLE tbEventParticipant 
ADD CONSTRAINT fk_tbEventParticipant_eventId
FOREIGN KEY (
	eventId	
) REFERENCES tbEvent (
	eventId
);



/*
Event table
변경사항
1. unique key로 hostUserId와 createdAt(데이터 중복 방지, 식별기능)
2. latitude, longitude 추가(위도, 경도)
	- 지도 api보니까 위도, 경도 정보가 필요한 것 같습니다.	
*/

CREATE TABLE tbEvent (
	eventId int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	hostUserId int NOT NULL, /*이벤트 생성한 hostUserId*/
	createdAt date NOT NULL, /*이벤트 생성된 날짜*/
	eventDate date NOT NULL, /*이벤트 개최일*/
	modifiedAt date, /*이벤트 수정일*/
	content char(100) NOT NULL, /*url*/
	location char(100) NOT NULL, /*이벤트 위치: latitude, longitude...*/
	latitude float NOT NULL,
	longitude float NOT NULL,
	header char(100),
	rating float,
	maxParticipant smallint,
	curParticipant smallint
);

/*
호스트 + 이벤트 생성 시간은 식별자 속성이된다.
*/
ALTER TABLE tbEvent ADD CONSTRAINT unique_tbEvent UNIQUE (
	hostUserId,
	createdAt
);

ALTER TABLE tbUserEvent ADD CONSTRAINT fk_tbUserEvent_hostUserId 
FOREIGN KEY ( hostUserId ) 
REFERENCES tbUser ( userId );

/*
	event에 달아줄 해시태그 매핑
*/
CREATE TABLE tbEventHashtags (
	articleId int NOT NULL, /*eventId*/
	/* userID int NOT NULL /*??userID 왜 있죠?*/
	hashtagsSeq INT NOT NULL
);

ALTER TABLE tbEventHashtags ADD CONSTRAINT pk_tbEventHashtags
PRIMARY KEY(articleId, hashtagsSeq);

ALTER TABLE tbEventHashtags ADD CONSTRAINT fk_tbEventHashtags_tbHashtags 
FOREIGN KEY (hashtagsSeq)
REFERENCES tbHashtags (hashtagsSeq);


/*
	hashtag를 보관할 테이블.
*/
CREATE TABLE tbHashtags (
	hashtagSeq INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	hashtagName CHAR(30)
);

ALTER TABLE tbHashtags ADD CONSTRAINT unique_tbHashtags_hashtagName
UNIQUE (hashtagName);
