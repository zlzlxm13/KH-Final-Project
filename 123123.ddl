DROP TABLE board;
drop table pet;
drop table petkind;
drop table hospital;
drop table reservation;
drop table member;
drop table reply;
drop table boardkind;

CREATE TABLE board (
    boardkind_canum   NUMBER NOT NULL,
    bnum              NUMBER NOT NULL,
    btitle            VARCHAR2(50),
    bcontent          VARCHAR2(500 BYTE),
    reg_date          DATE,
    readcount         NUMBER,
    bpath             VARCHAR2(100),
    member_id         VARCHAR2(50) NOT NULL,
    col               NUMBER
);



ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY ( bnum );

CREATE TABLE boardkind (
    canum     NUMBER NOT NULL,
    catitle   VARCHAR2(50)
);

ALTER TABLE boardkind ADD CONSTRAINT boardkind_pk PRIMARY KEY ( canum );

CREATE TABLE hospital (
    hosnum         NUMBER NOT NULL,
    hosname        VARCHAR2(50),
    hoslocation    VARCHAR2(100),
    petkind_kind   VARCHAR2 (50)

     NOT NULL
);

ALTER TABLE hospital ADD CONSTRAINT hospital_pk PRIMARY KEY ( hosnum );

CREATE TABLE member (
    id         VARCHAR2(20) NOT NULL,
    password   VARCHAR2(20),
    name       VARCHAR2(20),
    grade      VARCHAR2(10),
    phonenum   VARCHAR2(20)

);

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( id );

CREATE TABLE pet (
    petname        VARCHAR2(30),
    petage         VARCHAR2(20),
    petsex         VARCHAR2(10),
    member_id      VARCHAR2(20) NOT NULL,
    petinfo        VARCHAR2(500),
    petkind_kind   VARCHAR2(40)

     NOT NULL
);

CREATE TABLE petkind (
    kind   VARCHAR2(40) 

     NOT NULL
);

ALTER TABLE petkind ADD CONSTRAINT petkind_pk PRIMARY KEY ( kind );

CREATE TABLE reply (
    replynum       NUMBER NOT NULL,
    replycontent   VARCHAR2(500),
    replydate      DATE,
    member_id      VARCHAR2(20) NOT NULL,
    board_bnum     NUMBER NOT NULL
);

CREATE TABLE reservation (
    res_num NUMBER,
    res_date          DATE,
    hospital_hosnum   NUMBER NOT NULL,
    member_id         VARCHAR2(20) NOT NULL
    
);


ALTER TABLE board
    ADD CONSTRAINT board_boardkind_fk FOREIGN KEY ( boardkind_canum )
        REFERENCES boardkind ( canum );

ALTER TABLE board
    ADD CONSTRAINT board_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE hospital
    ADD CONSTRAINT hospital_petkind_fk FOREIGN KEY ( petkind_kind )
        REFERENCES petkind ( kind );

ALTER TABLE pet
    ADD CONSTRAINT pet_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE pet
    ADD CONSTRAINT pet_petkind_fk FOREIGN KEY ( petkind_kind )
        REFERENCES petkind ( kind );

ALTER TABLE reply
    ADD CONSTRAINT reply_board_fk FOREIGN KEY ( board_bnum )
        REFERENCES board ( bnum );

ALTER TABLE reply
    ADD CONSTRAINT reply_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_hospital_fk FOREIGN KEY ( hospital_hosnum )
        REFERENCES hospital ( hosnum );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE board
    ADD CONSTRAINT board_boardkind_fk FOREIGN KEY ( boardkind_canum )
        REFERENCES boardkind ( canum );

ALTER TABLE board
    ADD CONSTRAINT board_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE hospital
    ADD CONSTRAINT hospital_petkind_fk FOREIGN KEY ( petkind_kind )
        REFERENCES petkind ( kind );

ALTER TABLE pet
    ADD CONSTRAINT pet_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE pet
    ADD CONSTRAINT pet_petkind_fk FOREIGN KEY ( petkind_kind )
        REFERENCES petkind ( kind );

ALTER TABLE reply
    ADD CONSTRAINT reply_board_fk FOREIGN KEY ( board_bnum )
        REFERENCES board ( bnum );

ALTER TABLE reply
    ADD CONSTRAINT reply_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_hospital_fk FOREIGN KEY ( hospital_hosnum )
        REFERENCES hospital ( hosnum );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );
        

CREATE SEQUENCE Hos_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

CREATE SEQUENCE Board_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
CREATE SEQUENCE REP_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
  
        commit;
        