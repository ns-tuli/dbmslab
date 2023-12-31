CREATE TABLE ACCOUNT
(
	ACCOUNT_NO VARCHAR2(5),
	BALANCE NUMBER NOT NULL,
	CONSTRAINT ACCOUNT_TABLE_PK PRIMARY KEY (ACCOUNT_NO)
);

CREATE TABLE CUSTOMER
(
	CUSTOMER_NO VARCHAR2(5),
	CUSTOMER_NAME VARCHAR(20) NOT NULL,
	CUSTOMER_CITY VARCHAR(10),
	CONSTRAINT CUSTOMER_TABLE_PK PRIMARY KEY (CUSTOMER_NO)
);

CREATE TABLE DEPOSITOR
(
	ACCOUNT_NO VARCHAR2(5),
	CUSTOMER_NO VARCHAR2(5),
	CONSTRAINT DEPOSITOR_TABLE_PK PRIMARY KEY (ACCOUNT_NO,CUSTOMER_NO)
);

ALTER TABLE CUSTOMER ADD DATE_OF_BIRTH DATE;

ALTER TABLE ACCOUNT MODIFY BALANCE NUMBER (2 , 1);

ALTER TABLE DEPOSITOR RENAME COLUMN ACCOUNT_NO TO A_NO;

ALTER TABLE DEPOSITOR RENAME COLUMN CUSTOMER_NO TO B_NO ;

ALTER TABLE DEPOSITOR RENAME TO DEPOSITOR_INFO;


ALTER TABLE ACCOUNT MODIFY BALANCE NUMBER (12 , 1);

ALTER TABLE DEPOSITOR_INFO ADD CONSTRAINT FK_DEPOSITOR_ACCOUNT FOREIGN KEY(A_NO) REFERENCES ACCOUNT(ACCOUNT_NO);

ALTER TABLE DEPOSITOR_INFO ADD CONSTRAINT FK_DEPOSITOR_CUSTOMER FOREIGN KEY(B_NO) REFERENCES CUSTOMER(CUSTOMER_NO);

INSERT INTO ACCOUNT VALUES(101,10000);
INSERT INTO ACCOUNT VALUES(102,20000);
INSERT INTO ACCOUNT VALUES(103,30000);

INSERT INTO CUSTOMER VALUES(1,'ABC','DHK','20-JAN-22');
INSERT INTO CUSTOMER VALUES(2,'EFG','BAR','20-JAN-22');
INSERT INTO CUSTOMER VALUES(3,'HIJ','KHU','20-JAN-22');

INSERT INTO  DEPOSITOR_INFO VALUES(101,1);
INSERT INTO  DEPOSITOR_INFO VALUES(102,2);
INSERT INTO  DEPOSITOR_INFO VALUES(103,3);

SELECT * FROM ACCOUNT WHERE BALANCE<10000;

SELECT * FROM CUSTOMER WHERE CUSTOMER_CITY='KHU';

SELECT * FROM ACCOUNT, DEPOSITOR_INFO;

SELECT * FROM CUSTOMER NATURAL JOIN  DEPOSITOR_INFO ;

SELECT CUSTOMER_NAME,CUSTOMER_CITY FROM CUSTOMER,ACCOUNT,DEPOSITOR_INFO;

SELECT CUSTOMER_NAME,CUSTOMER_CITY FROM CUSTOMER,ACCOUNT,DEPOSITOR_INFO;

SELECT * FROM  CUSTOMER,ACCOUNT,DEPOSITOR_INFO WHERE ACCOUNT.ACCOUNT_NO=DEPOSITOR_INFO.A_NO AND CUSTOMER.CUSTOMER_NO=DEPOSITOR_INFO.B_NO AND ACCOUNT.BALANCE>1000;

SELECT * FROM  CUSTOMER,ACCOUNT,DEPOSITOR_INFO WHERE ACCOUNT.ACCOUNT_NO=DEPOSITOR_INFO.A_NO AND CUSTOMER.CUSTOMER_NO=DEPOSITOR_INFO.B_NO AND ACCOUNT.BALANCE>5000 AND ACCOUNT.BALANCE<10000 OR CUSTOMER_CITY='DHK';

UPDATE CUSTOMER SET CUSTOMER_CITY ='KHN' WHERE CUSTOMER_CITY ='KHU';


UPDATE CUSTOMER SET CUSTOMER_NO =301 WHERE CUSTOMER_NO =101;


DELETE FROM CUSTOMER  WHERE CUSTOMER_NO =301;

DELETE FROM ACCOUNT;
DELETE FROM CUSTOMER;
DELETE FROM DEPOSITOR_INFO;



































