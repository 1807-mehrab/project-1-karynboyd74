CREATE TABLE GUEST
(
    GUESTID INTEGER NOT NULL,
    GUESTFIRSTNAME VARCHAR2(50) NOT NULL,
    GUESTLASTNAME VARCHAR2(50) NOT NULL,
    GUESTEMAIL VARCHAR2 (25) NOT NULL, 
    CONSTRAINT PK_GUEST PRIMARY KEY  (GUESTID)
);

CREATE TABLE HOST
(
    HOSTID INTEGER NOT NULL,
    HOSTFIRSTNAME VARCHAR2(50) NOT NULL,
    HOSTLASTNAME VARCHAR2(50) NOT NULL,
    HOSTEMAIL VARCHAR2 (25) NOT NULL, 
    CONSTRAINT PK_HOST PRIMARY KEY  (HOSTID)
);

CREATE TABLE ROOMTYPE
(
    ROOMTYPEID INTEGER NOT NULL,
    ROOMDESC VARCHAR(20),
    ROOMPRICE NUMBER,
    ROOMMAXGUEST INTEGER,
    CONSTRAINT PK_ROOMTYPE PRIMARY KEY (ROOMTYPEID)
);

CREATE TABLE RESERVATION (
    RESERVATIONID INTEGER NOT NULL, 
    GUESTID INTEGER NOT NULL, 
    HOSTID INTEGER NOT NULL, 
    ROOMID INTEGER NOT NULL,
    RESERVEDDATE DATE,
    RESERVENUMNIGHTS INTEGER, 
    RESERVENUMGUESTS INTEGER,
    RESERVESTARTDATE DATE,
    RESERVEENDDATE DATE,
    CONSTRAINT PK_RESERVATION PRIMARY KEY (RESERVATIONID)
);

CREATE TABLE ROOM
(
    ROOMID INTEGER NOT NULL,
    ROOMTYPEID INTEGER NOT NULL,
    CONSTRAINT PK_ROOM PRIMARY KEY (ROOMID)
);

ALTER TABLE ROOM ADD CONSTRAINT FK_ROOMTYPEID
    FOREIGN KEY (ROOMTYPEID) REFERENCES ROOMTYPE (ROOMTYPEID);
    
ALTER TABLE RESERVATION ADD CONSTRAINT FK_GUESTID
    FOREIGN KEY (GUESTID) REFERENCES GUEST (GUESTID);
    
ALTER TABLE RESERVATION ADD CONSTRAINT FK_HOSTID
    FOREIGN KEY (HOSTID) REFERENCES HOST (HOSTID);
    
ALTER TABLE RESERVATION ADD CONSTRAINT FK_ROOMID
    FOREIGN KEY (ROOMID) REFERENCES ROOM (ROOMID);
    
INSERT INTO GUEST VALUES (1, 'Harry', 'Dresden', 'hdresden@wizard.com');
INSERT INTO GUEST VALUES (2, 'Karrin','Murphy', 'ltmurphy@cpd.org');
INSERT INTO GUEST VALUES (3, 'Waldo','Butters', 'butters@polkarocks.com');
INSERT INTO GUEST VALUES (4, 'Thomas','Raith', 'traith@raith.com');
INSERT INTO GUEST VALUES (5, 'Michael','Carpenter', 'john316@knights.org');

SELECT * FROM GUEST;

INSERT INTO HOST VALUES (1, 'Gandalf','the Gray', 'gandalf@theroad.com');
INSERT INTO HOST VALUES (2, 'Albus','Dumbledore', 'dumbledore@hogwarts.edu');
INSERT INTO HOST VALUES (3, 'Morgan','Le Fay', 'witchesRule@witches.com');
INSERT INTO HOST VALUES (4, 'Minerva','McGonagall', 'catPerson@hogwarts.edu');
INSERT INTO HOST VALUES (5, 'Merlin','the Wizard', 'imakekings@merlin.com');

INSERT INTO ROOMTYPE VALUES (1, 'Jester Suite', 100, 5);
INSERT INTO ROOMTYPE VALUES (2, 'Wizard Suite', 200, 4);
INSERT INTO ROOMTYPE VALUES (3, 'Heir Suite', 300, 3);
INSERT INTO ROOMTYPE VALUES (4, 'Queen Suite', 400, 2);
INSERT INTO ROOMTYPE VALUES (5, 'King Suite', 500, 1);

INSERT INTO ROOM VALUES (1, 1);
INSERT INTO ROOM VALUES (2, 2);
INSERT INTO ROOM VALUES (3, 3);
INSERT INTO ROOM VALUES (4, 4);
INSERT INTO ROOM VALUES (5, 5);

INSERT INTO RESERVATION VALUES (1, 1, 1, 1, (TO_DATE ('2018/07/01 10:46:44' , 'yyyy/mm/dd hh24:mi:ss')), 3, 3, (TO_DATE ('2018/08/01 16:00:00' , 'yyyy/mm/dd hh24:mi:ss')), (TO_DATE ('2018/08/04 09:32:01' , 'yyyy/mm/dd hh24:mi:ss')));
INSERT INTO RESERVATION VALUES (2, 2, 2, 2, (TO_DATE ('2018/07/01 10:46:44' , 'yyyy/mm/dd hh24:mi:ss')), 3, 4, (TO_DATE ('2018/08/01 16:00:00' , 'yyyy/mm/dd hh24:mi:ss')), (TO_DATE ('2018/08/04 09:32:01' , 'yyyy/mm/dd hh24:mi:ss')));
INSERT INTO RESERVATION VALUES (3, 3, 3, 3, (TO_DATE ('2018/06/16 10:46:44' , 'yyyy/mm/dd hh24:mi:ss')), 1, 3, (TO_DATE ('2018/08/20 16:00:00' , 'yyyy/mm/dd hh24:mi:ss')), (TO_DATE ('2018/08/21 09:32:01' , 'yyyy/mm/dd hh24:mi:ss')));
INSERT INTO RESERVATION VALUES (4, 4, 4, 4, (TO_DATE ('2018/10/30 10:46:44' , 'yyyy/mm/dd hh24:mi:ss')), 7, 2, (TO_DATE ('2019/07/03 16:00:00' , 'yyyy/mm/dd hh24:mi:ss')), (TO_DATE ('2019/07/11 09:32:01' , 'yyyy/mm/dd hh24:mi:ss')));
INSERT INTO RESERVATION VALUES (5, 5, 5, 5, (TO_DATE ('2016/02/15 10:46:44' , 'yyyy/mm/dd hh24:mi:ss')), 2, 1, (TO_DATE ('2016/12/31 16:00:00' , 'yyyy/mm/dd hh24:mi:ss')), (TO_DATE ('2017/01/02 09:32:01' , 'yyyy/mm/dd hh24:mi:ss')));


SELECT GUEST.GUESTFIRSTNAME, GUEST.GUESTLASTNAME, RESERVATION.RESERVESTARTDATE, reservation.reserveenddate
FROM GUEST
JOIN RESERVATION
ON GUEST.GUESTID = RESERVATION.GUESTID;
