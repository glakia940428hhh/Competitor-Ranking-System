use BUDT758_DB_Student_055

drop table  [terp.rank]
drop table  [terp.own]
drop table  [terp.school];
drop table  [terp.location];
drop table  [terp.degree];
drop table  [terp.year];
drop table  [terp.source];

create table [terp.source](
sourceId char(2) not null,
 sourceName varchar(50) ,
 CONSTRAINT pk_terp_sourceId PRIMARY KEY (sourceId)
);
create table [terp.year](
yearId char(2) not null,
 yearName varchar(10),
 CONSTRAINT pk_terp_yearId PRIMARY KEY (yearId)
);

create table [terp.degree](
degreeId char(2) not null,
 degreeName varchar(10),
 typename varchar(10),
 CONSTRAINT pk_terp_degreeId PRIMARY KEY (degreeId)
);

create table [terp.location](
locationId char(2) not null,
 statename varchar(10),
 city varchar(20),
 zip char(5)
 CONSTRAINT pk_terp_locationId PRIMARY KEY (locationId)
);

create table [terp.school](
schoolId char(2) not null,
 schoolName varchar(50),
 locationId char(2) ,
 CONSTRAINT pk_terp_schoolId PRIMARY KEY (schoolId),
 CONSTRAINT fk_terp_locationId1 FOREIGN KEY (locationId) 
		REFERENCES [terp.location] (locationId)
		ON DELETE NO ACTION ON UPDATE CASCADE,
);

create table[terp.own](
degreeId char(2) not null,
schoolId char(2) not null,
CONSTRAINT pk_terp_schoolId_degreeId PRIMARY KEY (schoolId,degreeId),
CONSTRAINT fk_terp_schoolId FOREIGN KEY (schoolId) 
		REFERENCES [terp.school] (schoolId)
		ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_terp_degreeId FOREIGN KEY (degreeId) 
		REFERENCES [terp.degree] (degreeId)
		ON DELETE CASCADE ON UPDATE CASCADE,
);

create table [terp.rank](
schoolId char(2) not null,
degreeId char(2) not null,
yearId char(2) not null,
sourceId char(2) not null,
rankNo char(2)not null,
CONSTRAINT pk_terp_schoolId_degreeId_yearId_sourceId PRIMARY KEY (schoolId,degreeId,yearId,sourceId),
CONSTRAINT fk_terp_schoolId1 FOREIGN KEY (schoolId) 
		REFERENCES [terp.school] (schoolId)
		ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_terp_degreeId1 FOREIGN KEY (degreeId) 
		REFERENCES [terp.degree] (degreeId)
		ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_terp_yearId FOREIGN KEY (yearId) 
		REFERENCES [terp.year] (yearId)
		ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_terp_sourceId FOREIGN KEY (sourceId) 
		REFERENCES [terp.source] (sourceId)
		ON DELETE CASCADE ON UPDATE CASCADE,
);



--insert source
INSERT INTO [terp.source] VALUES 
	('01','USnews')
INSERT INTO [terp.source] VALUES 
	('02','Times')
INSERT INTO [terp.source] VALUES 
	('03','QS')
INSERT INTO [terp.source] VALUES 
	('04','Eduniversal best master Ranking')


--insert year
INSERT INTO [terp.year] VALUES 
	('01','2014')
INSERT INTO [terp.year] VALUES 
	('02','2015')
INSERT INTO [terp.year] VALUES 
	('03','2016')

--insert degree
INSERT INTO [terp.degree] VALUES 
	('01','MBA','full-time')
INSERT INTO [terp.degree] VALUES 
	('02','MSIS','full-time')
INSERT INTO [terp.degree] VALUES 
	('03','BA','full-time')


--insert location
INSERT INTO [terp.location] VALUES
('01', 'MA','Cambridge','02142');
INSERT INTO [terp.location] VALUES
('02','PA','Pittsburgh','15213');
INSERT INTO [terp.location] VALUES
('03','TX','Austin','78712');
INSERT INTO [terp.location] VALUES
('04','AZ','Tucson','85721');
INSERT INTO [terp.location] VALUES
('05','MN','Twin Cities','55455');
INSERT INTO [terp.location] VALUES
('06','PA','PHILADELPHIA','19104');
INSERT INTO [terp.location] VALUES
('07','MD','College Park','20742');
INSERT INTO [terp.location] VALUES
('08','GA','Atlanta','30302');
INSERT INTO [terp.location] VALUES
('09','CA','Stanford','94305');
INSERT INTO [terp.location] VALUES
('10','NY','New York','10012');
INSERT INTO [terp.location] VALUES
('11','IN','Bloomington','47401');
INSERT INTO [terp.location] VALUES
('12','IN','West Lafayette','47907');
INSERT INTO [terp.location] VALUES
('13','CA','Berkeley','94720');
INSERT INTO [terp.location] VALUES
('14','MI','Ann Arbor','48109');
INSERT INTO [terp.location] VALUES
('15','TX','Dallas','75275');
INSERT INTO [terp.location] VALUES
('16','AZ','Phoenix','85287');
INSERT INTO [terp.location] VALUES
('17','GA','Atlanta','30332');
INSERT INTO [terp.location] VALUES
('18','CA','Los Angeles','90095');
INSERT INTO [terp.location] VALUES
('19','GA','Athens','30602');
INSERT INTO [terp.location] VALUES
('20','OH','Columbus','43210');
INSERT INTO [terp.location] VALUES
('21','WA','Seattle','98194');
INSERT INTO [terp.location] VALUES
('22','IL','Chicago','60637');
INSERT INTO [terp.location] VALUES
('23','IL','Evanston','60208');
INSERT INTO [terp.location] VALUES
('24','NY','New York','10027');
INSERT INTO [terp.location] VALUES
('25','NC','Durham','27708');
INSERT INTO [terp.location] VALUES
('26','NC','Chapel Hill','27599');
INSERT INTO [terp.location] VALUES
('27','CA','Los Angeles','90089');
INSERT INTO [terp.location] VALUES
('28','VA','Charlottesville','22904');
INSERT INTO [terp.location] VALUES
('29','MO','Louis','63130');
INSERT INTO [terp.location] VALUES
('30','GA','Atlanta','30322');
INSERT INTO [terp.location] VALUES
('31','TX','Dallas','75275');
INSERT INTO [terp.location] VALUES
('32','NY','Ithaca','10016');
INSERT INTO [terp.location] VALUES
('33','CA','Santa Clara','95053');
INSERT INTO [terp.location] VALUES
('34','PA','Philadephia','19131');
INSERT INTO [terp.location] VALUES
('35','IN','Notre Dame','46556');
INSERT INTO [terp.location] VALUES
('36','WA','Seattle','98122');
INSERT INTO [terp.location] VALUES
('37','OH','Cincinnati','45207');
INSERT INTO [Terp.location] VALUES
('38','MA','Cambridge','02138');
INSERT INTO [Terp.location] VALUES
('39','CT','New Haven','06520');
INSERT INTO [Terp.location] VALUES
('40','NH','Hanover','03755');
INSERT INTO [Terp.location] VALUES
('41','TX','Houston','77005');
INSERT INTO [Terp.location] VALUES
('42','DC','Washington','20057');
INSERT INTO [Terp.location] VALUES
('43','MA','Boston','02215');
INSERT INTO [Terp.location] VALUES
('44','MA','Wellesley','02457');
INSERT INTO [Terp.location] VALUES
('45','FL','Gainesville','32611');
INSERT INTO [Terp.location] VALUES
('46','CA','Davis','95616');
INSERT INTO [Terp.location] VALUES
('47','TX','College Station','77843');
INSERT INTO [Terp.location] VALUES
('48','MD','Baltimore','21218');
INSERT INTO [Terp.location] VALUES
('49','DC','Washington','20052');
INSERT INTO [Terp.location] VALUES
('50','IN','Champaign','61801');
INSERT INTO [Terp.location] VALUES
('51','MI','East Lansing','48824');	
INSERT INTO [Terp.location] VALUES
('52','NY','Rochester','14611');	
INSERT INTO [Terp.location] VALUES
('53','NJ','New Brunswick','08901');
INSERT INTO [Terp.location] VALUES
('54','PA','Pittsburgh','15260');	
INSERT INTO [Terp.location] VALUES
('55','MA','Waltham','02452');	
INSERT INTO [Terp.location] VALUES
('56','FL','Gainesville','32611');
INSERT INTO [Terp.location] VALUES
('57','NJ','Princeton','08544');
INSERT INTO [Terp.location] VALUES
('58','CA',	'Pasadena',	'91125');

--insert school
INSERT INTO [terp.school] VALUES 
	('01','Massachusetts Institute of Technology','01')
INSERT INTO [terp.school] VALUES 
	('02','Carnegie Mellon University','02')
INSERT INTO [terp.school] VALUES 
	('03','University of Texas-Austin','03')
INSERT INTO [terp.school] VALUES 
	('04','The University of Arizona','04')
INSERT INTO [terp.school] VALUES 
	('05','University of Minnesota- Twin Cities','05')
INSERT INTO [terp.school] VALUES 
	('06','University of Pennsylvania','06')
INSERT INTO [terp.school] VALUES 
	('07','University of Maryland -Park','07')
INSERT INTO [terp.school] VALUES 
	('08','Georgia State University','08')
INSERT INTO [terp.school] VALUES 
	('09','Stanford University','09')
INSERT INTO [terp.school] VALUES 
	('10','New York University','10')
INSERT INTO [terp.school] VALUES 
	('11','Indiana University-Bloomington','11')
INSERT INTO [terp.school] VALUES 
	('12','Purdue University-West Lafayette','12')
INSERT INTO [terp.school] VALUES 
	('13','University of California -Berkeley','13')
INSERT INTO [terp.school] VALUES 
	('14','University of Michigan- Ann Arbor','14')
INSERT INTO [terp.school] VALUES 
	('15',' The University of Texas-Dallas','15')
INSERT INTO [terp.school] VALUES 
	('16',' Arizona State University','16')
INSERT INTO [terp.school] VALUES 
	('17',' Georgia Institute of Technology','17')
INSERT INTO [terp.school] VALUES 
	('18',' University of California -Los Angeles','18')
INSERT INTO [terp.school] VALUES 
	('19',' The University of Georgia','19')
INSERT INTO [terp.school] VALUES 
	('20','Ohio State University ','20')
INSERT INTO [terp.school] VALUES 
	('21','University of Washington','21')
INSERT INTO [terp.school] VALUES 
	('22',' Temple University','22')
INSERT INTO [terp.school] VALUES 
	('23','Northwestern University','23')
INSERT INTO [terp.school] VALUES 
	('24','Columbia University','24')
INSERT INTO [terp.school] VALUES 
	('25','Duke University','25')
INSERT INTO [terp.school] VALUES 
	('26','The University of North Carolina at Chapel Hill','26')
INSERT INTO [terp.school] VALUES 
	('27','University of Southern California','27')
INSERT INTO [terp.school] VALUES 
	('28','University of Virginia','28')
INSERT INTO [terp.school] VALUES 
	('29','Washington University in St Louis','29')
INSERT INTO [terp.school] VALUES 
	('30', 'Emory University','30')
INSERT INTO [terp.school] VALUES 
	('31','Southern Methodist University','31')
INSERT INTO [terp.school] VALUES 
	('32','Cornell University','32')
INSERT INTO [terp.school] VALUES 
	('33','Santa Clara University','33')
INSERT INTO [terp.school] VALUES 
	('34','St. Josephs University','34')
INSERT INTO [terp.school] VALUES 
	('35','University of Notre Dame','35')
INSERT INTO [terp.school] VALUES 
	('36','Seattle University ','36')
INSERT INTO [terp.school] VALUES 
	('37','Xavier University','37')
INSERT INTO [terp.school] VALUES 
	('38','Harvard Business School','38')
INSERT INTO [terp.school] VALUES 
	('39','Yale University','39')
INSERT INTO [terp.school] VALUES 
	('40','Dartmouth College','40')
INSERT INTO [terp.school] VALUES 
	('41','Rice University','41')
INSERT INTO [terp.school] VALUES 
	('42','Georgetown University','42')
INSERT INTO [terp.school] VALUES 
	('43','Boston University','43')
INSERT INTO [terp.school] VALUES 
	('44','Babson College','44')
INSERT INTO [terp.school] VALUES 
	('45','University of Florida','45')
INSERT INTO [terp.school] VALUES 
	('46','University of California - Davis','46')
INSERT INTO [terp.school] VALUES 
	('47','Texas A&M University','47')
INSERT INTO [terp.school] VALUES 
	('48','Johns Hopkins University','48')
INSERT INTO [terp.school] VALUES 
	('49','George Washington University','49')
INSERT INTO [terp.school] VALUES 
	('50','University of Illinois at Urbana-Champaign','50')
INSERT INTO [terp.school] VALUES 
	('51','Michigan State University','51')
INSERT INTO [terp.school] VALUES 
	('52','University of Rochester','52')
INSERT INTO [terp.school] VALUES 
	('53','Rutgers University','53')
INSERT INTO [terp.school] VALUES 
	('54','University of Pittsburgh','54')
INSERT INTO [terp.school] VALUES 
	('55','Bentley University','55')
INSERT INTO [terp.school] VALUES 
	('56','University of Florida','56')
INSERT INTO [terp.school] VALUES 
	('57','Princeton University','57')
INSERT INTO [terp.school] VALUES 
	('58','California Institude of techonology','58')



--insert terp.own degree01
INSERT INTO [terp.own] VALUES 
	('01','01')
INSERT INTO [terp.own] VALUES 
	('01','02')
INSERT INTO [terp.own] VALUES 
	('01','03')
INSERT INTO [terp.own] VALUES 
	('01','04')
INSERT INTO [terp.own] VALUES 
	('01','05')
INSERT INTO [terp.own] VALUES 
	('01','06')
INSERT INTO [terp.own] VALUES 
	('01','07')
INSERT INTO [terp.own] VALUES 
	('01','08')
INSERT INTO [terp.own] VALUES 
	('01','09')
INSERT INTO [terp.own] VALUES 
	('01','10')
INSERT INTO [terp.own] VALUES 
	('01','11')
INSERT INTO [terp.own] VALUES 
	('01','12')
INSERT INTO [terp.own] VALUES 
	('01','13')
INSERT INTO [terp.own] VALUES 
	('01','14')
INSERT INTO [terp.own] VALUES 
	('01','15')
INSERT INTO [terp.own] VALUES 
	('01','16')
INSERT INTO [terp.own] VALUES 
	('01','17')
INSERT INTO [terp.own] VALUES 
	('01','18')
INSERT INTO [terp.own] VALUES 
	('01','19')
INSERT INTO [terp.own] VALUES 
	('01','20')
INSERT INTO [terp.own] VALUES 
	('01','21')
INSERT INTO [terp.own] VALUES 
	('01','22')
INSERT INTO [terp.own] VALUES 
	('01','23')
INSERT INTO [terp.own] VALUES 
	('01','24')
INSERT INTO [terp.own] VALUES 
	('01','25')
INSERT INTO [terp.own] VALUES 
	('01','26')
INSERT INTO [terp.own] VALUES 
	('01','27')
INSERT INTO [terp.own] VALUES 
	('01','28')
INSERT INTO [terp.own] VALUES 
	('01','29')
INSERT INTO [terp.own] VALUES 
	('01','30')
INSERT INTO [terp.own] VALUES 
	('01','31')
INSERT INTO [terp.own] VALUES 
	('01','32')
INSERT INTO [terp.own] VALUES 
	('01','33')
INSERT INTO [terp.own] VALUES 
	('01','34')
INSERT INTO [terp.own] VALUES 
	('01','35')
INSERT INTO [terp.own] VALUES 
	('01','36')
INSERT INTO [terp.own] VALUES 
	('01','37')
INSERT INTO [terp.own] VALUES 
	('01','38')
INSERT INTO [terp.own] VALUES 
	('01','39')
INSERT INTO [terp.own] VALUES 
	('01','40')
INSERT INTO [terp.own] VALUES 
	('01','41')
INSERT INTO [terp.own] VALUES 
	('01','42')
INSERT INTO [terp.own] VALUES 
	('01','43')
INSERT INTO [terp.own] VALUES 
	('01','44')
INSERT INTO [terp.own] VALUES 
	('01','45')
INSERT INTO [terp.own] VALUES 
	('01','46')
INSERT INTO [terp.own] VALUES 
	('01','47')
INSERT INTO [terp.own] VALUES 
	('01','48')
INSERT INTO [terp.own] VALUES 
	('01','49')
INSERT INTO [terp.own] VALUES 
	('01','50')
INSERT INTO [terp.own] VALUES 
	('01','51')
INSERT INTO [terp.own] VALUES 
	('01','52')
INSERT INTO [terp.own] VALUES 
	('01','53')
INSERT INTO [terp.own] VALUES 
	('01','54')
INSERT INTO [terp.own] VALUES 
	('01','55')
INSERT INTO [terp.own] VALUES 
	('01','56')
INSERT INTO [terp.own] VALUES 
	('01','57')
INSERT INTO [terp.own] VALUES 
	('01','58')


--insert terp.own degree02
INSERT INTO [terp.own] VALUES 
	('02','01')
INSERT INTO [terp.own] VALUES 
	('02','02')
INSERT INTO [terp.own] VALUES 
	('02','03')
INSERT INTO [terp.own] VALUES 
	('02','04')
INSERT INTO [terp.own] VALUES 
	('02','05')
INSERT INTO [terp.own] VALUES 
	('02','06')
INSERT INTO [terp.own] VALUES 
	('02','07')
INSERT INTO [terp.own] VALUES 
	('02','08')
INSERT INTO [terp.own] VALUES 
	('02','09')
INSERT INTO [terp.own] VALUES 
	('02','10')
INSERT INTO [terp.own] VALUES 
	('02','11')
INSERT INTO [terp.own] VALUES 
	('02','12')
INSERT INTO [terp.own] VALUES 
	('02','13')
INSERT INTO [terp.own] VALUES 
	('02','14')
INSERT INTO [terp.own] VALUES 
	('02','15')
INSERT INTO [terp.own] VALUES 
	('02','16')
INSERT INTO [terp.own] VALUES 
	('02','17')
INSERT INTO [terp.own] VALUES 
	('02','18')
INSERT INTO [terp.own] VALUES 
	('02','19')
INSERT INTO [terp.own] VALUES 
	('02','20')
INSERT INTO [terp.own] VALUES 
	('02','21')
INSERT INTO [terp.own] VALUES 
	('02','22')
INSERT INTO [terp.own] VALUES 
	('02','23')
INSERT INTO [terp.own] VALUES 
	('02','24')
INSERT INTO [terp.own] VALUES 
	('02','25')
INSERT INTO [terp.own] VALUES 
	('02','26')
INSERT INTO [terp.own] VALUES 
	('02','27')
INSERT INTO [terp.own] VALUES 
	('02','28')
INSERT INTO [terp.own] VALUES 
	('02','29')
INSERT INTO [terp.own] VALUES 
	('02','30')
INSERT INTO [terp.own] VALUES 
	('02','31')
INSERT INTO [terp.own] VALUES 
	('02','32')
INSERT INTO [terp.own] VALUES 
	('02','33')
INSERT INTO [terp.own] VALUES 
	('02','34')
INSERT INTO [terp.own] VALUES 
	('02','35')
INSERT INTO [terp.own] VALUES 
	('02','36')
INSERT INTO [terp.own] VALUES 
	('02','37')
INSERT INTO [terp.own] VALUES 
	('02','38')
INSERT INTO [terp.own] VALUES 
	('02','39')
INSERT INTO [terp.own] VALUES 
	('02','40')
INSERT INTO [terp.own] VALUES 
	('02','41')
INSERT INTO [terp.own] VALUES 
	('02','42')
INSERT INTO [terp.own] VALUES 
	('02','43')
INSERT INTO [terp.own] VALUES 
	('02','44')
INSERT INTO [terp.own] VALUES 
	('02','45')
INSERT INTO [terp.own] VALUES 
	('02','46')
INSERT INTO [terp.own] VALUES 
	('02','47')
INSERT INTO [terp.own] VALUES 
	('02','48')
INSERT INTO [terp.own] VALUES 
	('02','49')
INSERT INTO [terp.own] VALUES 
	('02','50')
INSERT INTO [terp.own] VALUES 
	('02','51')
INSERT INTO [terp.own] VALUES 
	('02','52')
INSERT INTO [terp.own] VALUES 
	('02','53')
INSERT INTO [terp.own] VALUES 
	('02','54')
INSERT INTO [terp.own] VALUES 
	('02','55')
INSERT INTO [terp.own] VALUES 
	('02','56')
INSERT INTO [terp.own] VALUES 
	('02','57')
INSERT INTO [terp.own] VALUES 
	('02','58')

--insert terp.own degree 03
INSERT INTO [terp.own] VALUES 
	('03','01')
INSERT INTO [terp.own] VALUES 
	('03','02')
INSERT INTO [terp.own] VALUES 
	('03','03')
INSERT INTO [terp.own] VALUES 
	('03','04')
INSERT INTO [terp.own] VALUES 
	('03','05')
INSERT INTO [terp.own] VALUES 
	('03','06')
INSERT INTO [terp.own] VALUES 
	('03','07')
INSERT INTO [terp.own] VALUES 
	('03','08')
INSERT INTO [terp.own] VALUES 
	('03','09')
INSERT INTO [terp.own] VALUES 
	('03','10')
INSERT INTO [terp.own] VALUES 
	('03','11')
INSERT INTO [terp.own] VALUES 
	('03','12')
INSERT INTO [terp.own] VALUES 
	('03','13')
INSERT INTO [terp.own] VALUES 
	('03','14')
INSERT INTO [terp.own] VALUES 
	('03','15')
INSERT INTO [terp.own] VALUES 
	('03','16')
INSERT INTO [terp.own] VALUES 
	('03','17')
INSERT INTO [terp.own] VALUES 
	('03','18')
INSERT INTO [terp.own] VALUES 
	('03','19')
INSERT INTO [terp.own] VALUES 
	('03','20')
INSERT INTO [terp.own] VALUES 
	('03','21')
INSERT INTO [terp.own] VALUES 
	('03','22')
INSERT INTO [terp.own] VALUES 
	('03','23')
INSERT INTO [terp.own] VALUES 
	('03','24')
INSERT INTO [terp.own] VALUES 
	('03','25')
INSERT INTO [terp.own] VALUES 
	('03','26')
INSERT INTO [terp.own] VALUES 
	('03','27')
INSERT INTO [terp.own] VALUES 
	('03','28')
INSERT INTO [terp.own] VALUES 
	('03','29')
INSERT INTO [terp.own] VALUES 
	('03','30')
INSERT INTO [terp.own] VALUES 
	('03','31')
INSERT INTO [terp.own] VALUES 
	('03','32')
INSERT INTO [terp.own] VALUES 
	('03','33')
INSERT INTO [terp.own] VALUES 
	('03','34')
INSERT INTO [terp.own] VALUES 
	('03','35')
INSERT INTO [terp.own] VALUES 
	('03','36')
INSERT INTO [terp.own] VALUES 
	('03','37')
INSERT INTO [terp.own] VALUES 
	('03','38')
INSERT INTO [terp.own] VALUES 
	('03','39')
INSERT INTO [terp.own] VALUES 
	('03','40')
INSERT INTO [terp.own] VALUES 
	('03','41')
INSERT INTO [terp.own] VALUES 
	('03','42')
INSERT INTO [terp.own] VALUES 
	('03','43')
INSERT INTO [terp.own] VALUES 
	('03','44')
INSERT INTO [terp.own] VALUES 
	('03','45')
INSERT INTO [terp.own] VALUES 
	('03','46')
INSERT INTO [terp.own] VALUES 
	('03','47')
INSERT INTO [terp.own] VALUES 
	('03','48')
INSERT INTO [terp.own] VALUES 
	('03','49')
INSERT INTO [terp.own] VALUES 
	('03','50')
INSERT INTO [terp.own] VALUES 
	('03','51')
INSERT INTO [terp.own] VALUES 
	('03','52')
INSERT INTO [terp.own] VALUES 
	('03','53')
INSERT INTO [terp.own] VALUES 
	('03','54')
INSERT INTO [terp.own] VALUES 
	('03','55')
INSERT INTO [terp.own] VALUES 
	('03','56')
INSERT INTO [terp.own] VALUES 
	('03','57')
INSERT INTO [terp.own] VALUES 
	('03','58')

--insert rank mba/2014/times

INSERT INTO [terp.rank] VALUES 
	('38','01','01','02','01')
INSERT INTO [terp.rank] VALUES 
	('09','01','01','02','02')
INSERT INTO [terp.rank] VALUES 
	('06','01','01','02','03')
INSERT INTO [terp.rank] VALUES 
	('24','01','01','02','04')
INSERT INTO [terp.rank] VALUES 
	('01','01','01','02','04')
INSERT INTO [terp.rank] VALUES 
	('22','01','01','02','06')
INSERT INTO [terp.rank] VALUES 
	('39','01','01','02','07')
INSERT INTO [terp.rank] VALUES 
	('13','01','01','02','08')
INSERT INTO [terp.rank] VALUES 
	('23','01','01','02','09')
INSERT INTO [terp.rank] VALUES 
	('10','01','01','02','10')
INSERT INTO [terp.rank] VALUES 
	('25','01','01','02','11')
INSERT INTO [terp.rank] VALUES 
	('40','01','01','02','12')
INSERT INTO [terp.rank] VALUES 
	('14','01','01','02','13')
INSERT INTO [terp.rank] VALUES 
	('18','01','01','02','14')
INSERT INTO [terp.rank] VALUES 
	('28','01','01','02','15')
INSERT INTO [terp.rank] VALUES 
	('32','01','01','02','16')
INSERT INTO [terp.rank] VALUES 
	('26','01','01','02','17')
INSERT INTO [terp.rank] VALUES 
	('02','01','01','02','18')
INSERT INTO [terp.rank] VALUES 
	('41','01','01','02','19')
INSERT INTO [terp.rank] VALUES 
	('42','01','01','02','20')

--insert rank mba/2015/times
INSERT INTO [terp.rank] VALUES 
	('38','01','02','02','01')
INSERT INTO [terp.rank] VALUES 
	('06','01','02','02','02')
INSERT INTO [terp.rank] VALUES 
	('09','01','02','02','03')
INSERT INTO [terp.rank] VALUES 
	('24','01','02','02','04')
INSERT INTO [terp.rank] VALUES 
	('01','01','02','02','04')
INSERT INTO [terp.rank] VALUES 
	('22','01','02','02','06')
INSERT INTO [terp.rank] VALUES 
	('13','01','02','02','07')
INSERT INTO [terp.rank] VALUES 
	('23','01','02','02','08')
INSERT INTO [terp.rank] VALUES 
	('39','01','02','02','09')
INSERT INTO [terp.rank] VALUES 
	('10','01','02','02','10')
INSERT INTO [terp.rank] VALUES 
	('25','01','02','02','11')
INSERT INTO [terp.rank] VALUES 
	('40','01','02','02','12')
INSERT INTO [terp.rank] VALUES 
	('14','01','02','02','13')
INSERT INTO [terp.rank] VALUES 
	('18','01','02','02','14')
INSERT INTO [terp.rank] VALUES 
	('32','01','02','02','15')
INSERT INTO [terp.rank] VALUES 
	('28','01','02','02','16')
INSERT INTO [terp.rank] VALUES 
	('02','01','02','02','17')
INSERT INTO [terp.rank] VALUES 
	('26','01','02','02','18')
INSERT INTO [terp.rank] VALUES 
	('03','01','02','02','19')
INSERT INTO [terp.rank] VALUES 
	('42','01','02','02','20')

--insert rank mba/2016/times
INSERT INTO [terp.rank] VALUES 
	('38','01','03','02','01')
INSERT INTO [terp.rank] VALUES 
	('06','01','03','02','02')
INSERT INTO [terp.rank] VALUES 
	('09','01','03','02','03')
INSERT INTO [terp.rank] VALUES 
	('24','01','03','02','04')
INSERT INTO [terp.rank] VALUES 
	('13','01','03','02','04')
INSERT INTO [terp.rank] VALUES 
	('22','01','03','02','06')
INSERT INTO [terp.rank] VALUES 
	('01','01','03','02','07')
INSERT INTO [terp.rank] VALUES 
	('23','01','03','02','08')
INSERT INTO [terp.rank] VALUES 
	('39','01','03','02','09')
INSERT INTO [terp.rank] VALUES 
	('10','01','03','02','10')
INSERT INTO [terp.rank] VALUES 
	('14','01','03','02','11')
INSERT INTO [terp.rank] VALUES 
	('25','01','03','02','12')
INSERT INTO [terp.rank] VALUES 
	('40','01','03','02','13')
INSERT INTO [terp.rank] VALUES 
	('28','01','03','02','14')
INSERT INTO [terp.rank] VALUES 
	('32','01','03','02','15')
INSERT INTO [terp.rank] VALUES 
	('02','01','03','02','16')
INSERT INTO [terp.rank] VALUES 
	('18','01','03','02','17')
INSERT INTO [terp.rank] VALUES 
	('26','01','03','02','18')
INSERT INTO [terp.rank] VALUES 
	('42','01','03','02','19')
INSERT INTO [terp.rank] VALUES 
	('03','01','03','02','20')




-- insert rank MBA/2014/UsNews 
INSERT INTO [terp.rank] VALUES 
	('06','01','01','01','01')
INSERT INTO [terp.rank] VALUES 
	('22','01','01','01','02')
INSERT INTO [terp.rank] VALUES 
	('23','01','01','01','03')
INSERT INTO [terp.rank] VALUES 
	('24','01','01','01','04')
INSERT INTO [terp.rank] VALUES 
	('25','01','01','01','04')
INSERT INTO [terp.rank] VALUES 
	('10','01','01','01','06')
INSERT INTO [terp.rank] VALUES 
	('18','01','01','01','07')
INSERT INTO [terp.rank] VALUES 
	('14','01','01','01','08')
INSERT INTO [terp.rank] VALUES 
	('26','01','01','01','09')
INSERT INTO [terp.rank] VALUES 
	('13','01','01','01','10')
INSERT INTO [terp.rank] VALUES 
	('27','01','01','01','11')
INSERT INTO [terp.rank] VALUES 
	('28','01','01','01','12')
INSERT INTO [terp.rank] VALUES 
	('09','01','01','01','13')
INSERT INTO [terp.rank] VALUES 
	('29','01','01','01','14')
INSERT INTO [terp.rank] VALUES 
	('30','01','01','01','15')
INSERT INTO [terp.rank] VALUES 
	('31','01','01','01','16')
INSERT INTO [terp.rank] VALUES 
	('01','01','01','01','17')
INSERT INTO [terp.rank] VALUES 
	('03','01','01','01','18')
INSERT INTO [terp.rank] VALUES 
	('32','01','01','01','19')
INSERT INTO [terp.rank] VALUES 
	('33','01','01','01','20')

-- insert rank MBA/2015/UsNews 
INSERT INTO [terp.rank] VALUES 
	('06','01','02','01','01')
INSERT INTO [terp.rank] VALUES 
	('22','01','02','01','02')
INSERT INTO [terp.rank] VALUES 
	('23','01','02','01','03')
INSERT INTO [terp.rank] VALUES 
	('25','01','02','01','04')
INSERT INTO [terp.rank] VALUES 
	('24','01','02','01','05')
INSERT INTO [terp.rank] VALUES 
	('10','01','02','01','06')
INSERT INTO [terp.rank] VALUES 
	('14','01','02','01','07')
INSERT INTO [terp.rank] VALUES 
	('18','01','02','01','08')
INSERT INTO [terp.rank] VALUES 
	('13','01','02','01','09')
INSERT INTO [terp.rank] VALUES 
	('26','01','02','01','10')
INSERT INTO [terp.rank] VALUES 
	('27','01','02','01','11')
INSERT INTO [terp.rank] VALUES 
	('29','01','02','01','12')
INSERT INTO [terp.rank] VALUES 
	('32','01','02','01','13')
INSERT INTO [terp.rank] VALUES 
	('03','01','02','01','14')
INSERT INTO [terp.rank] VALUES 
	('34','01','02','01','15')
INSERT INTO [terp.rank] VALUES 
	('31','01','02','01','16')
INSERT INTO [terp.rank] VALUES 
	('30','01','02','01','17')
INSERT INTO [terp.rank] VALUES 
	('33','01','02','01','18')

-- insert rank MBA/2016/UsNews 
INSERT INTO [terp.rank] VALUES 
	('22','01','03','01','01')
INSERT INTO [terp.rank] VALUES 
	('06','01','03','01','02')
INSERT INTO [terp.rank] VALUES 
	('23','01','03','01','03')
INSERT INTO [terp.rank] VALUES 
	('25','01','03','01','04')
INSERT INTO [terp.rank] VALUES 
	('24','01','03','01','05')
INSERT INTO [terp.rank] VALUES 
	('14','01','03','01','06')
INSERT INTO [terp.rank] VALUES 
	('10','01','03','01','07')
INSERT INTO [terp.rank] VALUES 
	('18','01','03','01','08')
INSERT INTO [terp.rank] VALUES 
	('13','01','03','01','09')
INSERT INTO [terp.rank] VALUES 
	('26','01','03','01','10')
INSERT INTO [terp.rank] VALUES 
	('28','01','03','01','11')
INSERT INTO [terp.rank] VALUES 
	('32','01','03','01','12')
INSERT INTO [terp.rank] VALUES 
	('31','01','03','01','13')
INSERT INTO [terp.rank] VALUES 
	('34','01','03','01','14')
INSERT INTO [terp.rank] VALUES 
	('01','01','03','01','15')
INSERT INTO [terp.rank] VALUES 
	('35','01','03','01','16')
INSERT INTO [terp.rank] VALUES 
	('03','01','03','01','17')
INSERT INTO [terp.rank] VALUES 
	('36','01','03','01','18')
INSERT INTO [terp.rank] VALUES 
	('37','01','03','01','19')
INSERT INTO [terp.rank] VALUES 
	('11','01','03','01','20')
INSERT INTO [terp.rank] VALUES 
	('27','01','03','01','21')
INSERT INTO [terp.rank] VALUES 
	('21','01','03','01','22')
INSERT INTO [terp.rank] VALUES 
	('30','01','03','01','23')
INSERT INTO [terp.rank] VALUES 
	('29','01','03','01','24')

-- insert rank MSIS/2014/UsNews 
INSERT INTO [Terp.rank] VALUES
	('01','02','01','01','01');
INSERT INTO [Terp.rank] VALUES
	('02','02','01','01','02');
INSERT INTO [Terp.rank] VALUES
	('03','02','01','01','03');
INSERT INTO [Terp.rank] VALUES
	('04','02','01','01','04');
INSERT INTO [Terp.rank] VALUES
	('05','02','01','01','05');
INSERT INTO [Terp.rank] VALUES
	('06','02','01','01','06');
INSERT INTO [Terp.rank] VALUES
	('07','02','01','01','07');
INSERT INTO [Terp.rank] VALUES
	('08','02','01','01','08');
INSERT INTO [Terp.rank] VALUES
	('09','02','01','01','09');
INSERT INTO [Terp.rank] VALUES
	('10','02','01','01','10');
INSERT INTO [Terp.rank] VALUES
	('11','02','01','01','11');
INSERT INTO [Terp.rank] VALUES
	('12','02','01','01','12');
INSERT INTO [Terp.rank] VALUES
	('13','02','01','01','13');
INSERT INTO [Terp.rank] VALUES
	('14','02','01','01','14');
INSERT INTO [Terp.rank] VALUES
	('15','02','01','01','15');
INSERT INTO [Terp.rank] VALUES
	('16','02','01','01','16');
INSERT INTO [Terp.rank] VALUES
	('17','02','01','01','17');
INSERT INTO [Terp.rank] VALUES
	('18','02','01','01','18');
INSERT INTO [Terp.rank] VALUES
	('19','02','01','01','19');

-- insert rank MSIS/2015/UsNews
INSERT INTO [Terp.rank] VALUES
	('01','02','02','01','01');
INSERT INTO [Terp.rank] VALUES
	('02','02','02','01','02');
INSERT INTO [Terp.rank] VALUES
	('03','02','02','01','03');
INSERT INTO [Terp.rank] VALUES
	('05','02','02','01','04');
INSERT INTO [Terp.rank] VALUES
	('04','02','02','01','05');
INSERT INTO [Terp.rank] VALUES
	('07','02','02','01','06');
INSERT INTO [Terp.rank] VALUES
	('06','02','02','01','06');
INSERT INTO [Terp.rank] VALUES
	('10','02','02','01','08');
INSERT INTO [Terp.rank] VALUES
	('09','02','02','01','09');
INSERT INTO [Terp.rank] VALUES
	('08','02','02','01','10');
INSERT INTO [Terp.rank] VALUES
	('11','02','02','01','10');
INSERT INTO [Terp.rank] VALUES
	('16','02','02','01','12');
INSERT INTO [Terp.rank] VALUES
	('17','02','02','01','12');
INSERT INTO [Terp.rank] VALUES
	('12','02','02','01','12');
INSERT INTO [Terp.rank] VALUES
	('20','02','02','01','15');
INSERT INTO [Terp.rank] VALUES
	('13','02','02','01','16');
INSERT INTO [Terp.rank] VALUES
	('19','02','02','01','17');
INSERT INTO [Terp.rank] VALUES
	('14','02','02','01','18');
INSERT INTO [Terp.rank] VALUES
	('21','02','02','01','19');
INSERT INTO [Terp.rank] VALUES
	('25','02','02','01','20');

-- insert rank MSIS/2016/UsNews
INSERT INTO [Terp.rank] VALUES
	('01','02','03','01','01');
INSERT INTO [Terp.rank] VALUES
	('02','02','03','01','02');
INSERT INTO [Terp.rank] VALUES
	('04','02','03','01','03');
INSERT INTO [Terp.rank] VALUES
	('05','02','03','01','03');
INSERT INTO [Terp.rank] VALUES
	('03','02','03','01','05');
INSERT INTO [Terp.rank] VALUES
	('07','02','03','01','06');
INSERT INTO [Terp.rank] VALUES
	('10','02','03','01','07');
INSERT INTO [Terp.rank] VALUES
	('06','02','03','01','08');
INSERT INTO [Terp.rank] VALUES
	('08','02','03','01','09');
INSERT INTO [Terp.rank] VALUES
	('09','02','03','01','10');
INSERT INTO [Terp.rank] VALUES
	('11','02','03','01','11');
INSERT INTO [Terp.rank] VALUES
	('16','02','03','01','12');
INSERT INTO [Terp.rank] VALUES
	('14','02','03','01','13');
INSERT INTO [Terp.rank] VALUES
	('17','02','03','01','14');
INSERT INTO [Terp.rank] VALUES
	('13','02','03','01','14');
INSERT INTO [Terp.rank] VALUES
	('22','02','03','01','16');
INSERT INTO [Terp.rank] VALUES
	('15','02','03','01','16');

-- insert rank MSIS/2014/QS 
INSERT INTO [Terp.rank] VALUES
	('01','02','01','03','01');
INSERT INTO [Terp.rank] VALUES
	('09','02','01','03','02');
INSERT INTO [Terp.rank] VALUES
	('02','02','01','03','03');
INSERT INTO [Terp.rank] VALUES
	('38','02','01','03','04');
INSERT INTO [Terp.rank] VALUES
	('13','02','01','03','05');
INSERT INTO [Terp.rank] VALUES
	('57','02','01','03','06');
INSERT INTO [Terp.rank] VALUES
	('18','02','01','03','07');
INSERT INTO [Terp.rank] VALUES
	('32','02','01','03','08');
INSERT INTO [Terp.rank] VALUES
	('50','02','01','03','09');
INSERT INTO [Terp.rank] VALUES
	('58','02','01','03','10');
INSERT INTO [Terp.rank] VALUES
	('21','02','01','03','11');
INSERT INTO [Terp.rank] VALUES
	('39','02','01','03','12');
INSERT INTO [Terp.rank] VALUES
	('03','02','01','03','13');
INSERT INTO [Terp.rank] VALUES
	('17','02','01','03','14');


-- insert rank MSIS/2015/QS 
INSERT INTO [Terp.rank] VALUES
	('01','02','02','03','01');
INSERT INTO [Terp.rank] VALUES
	('09','02','02','03','02');
INSERT INTO [Terp.rank] VALUES
	('02','02','02','03','03');
INSERT INTO [Terp.rank] VALUES
	('38','02','02','03','04');
INSERT INTO [Terp.rank] VALUES
	('13','02','02','03','05');
INSERT INTO [Terp.rank] VALUES
	('57','02','02','03','06');
INSERT INTO [Terp.rank] VALUES
	('18','02','02','03','07');
INSERT INTO [Terp.rank] VALUES
	('21','02','02','03','08');
INSERT INTO [Terp.rank] VALUES
	('03','02','02','03','09');
INSERT INTO [Terp.rank] VALUES
	('58','02','02','03','10');
INSERT INTO [Terp.rank] VALUES
	('24','02','02','03','11');
INSERT INTO [Terp.rank] VALUES
	('50','02','02','03','12');
INSERT INTO [Terp.rank] VALUES
	('32','02','02','03','13');
INSERT INTO [Terp.rank] VALUES
	('10','02','02','03','14');
INSERT INTO [Terp.rank] VALUES
	('39','02','02','03','15');

---- insert rank MSIS/2016/QS 
INSERT INTO [Terp.rank] VALUES
	('01','02','03','03','01');
INSERT INTO [Terp.rank] VALUES
	('09','02','03','03','02');
INSERT INTO [Terp.rank] VALUES
	('38','02','03','03','03');
INSERT INTO [Terp.rank] VALUES
	('02','02','03','03','04');
INSERT INTO [Terp.rank] VALUES
	('13','02','03','03','05');
INSERT INTO [Terp.rank] VALUES
	('57','02','03','03','06');
INSERT INTO [Terp.rank] VALUES
	('18','02','03','03','07');
INSERT INTO [Terp.rank] VALUES
	('17','02','03','03','08');
INSERT INTO [Terp.rank] VALUES
	('32','02','03','03','09');
INSERT INTO [Terp.rank] VALUES
	('58','02','03','03','10');
INSERT INTO [Terp.rank] VALUES
	('21','02','03','03','11');
INSERT INTO [Terp.rank] VALUES
	('50','02','03','03','12');
INSERT INTO [Terp.rank] VALUES
	('24','02','03','03','13');
INSERT INTO [Terp.rank] VALUES
	('03','02','03','03','14');
INSERT INTO [Terp.rank] VALUES
	('39','02','03','03','15');


--insert rank mba/2014/QS
INSERT INTO [Terp.rank] VALUES
	('38','01','01','03','01');
INSERT INTO [Terp.rank] VALUES
	('09','01','01','03','01');
INSERT INTO [Terp.rank] VALUES
	('06','01','01','03','01');
INSERT INTO [Terp.rank] VALUES
	('22','01','01','03','02');
INSERT INTO [Terp.rank] VALUES
	('24','01','01','03','03');
INSERT INTO [Terp.rank] VALUES
	('23','01','01','03','04');
INSERT INTO [Terp.rank] VALUES
	('01','01','01','03','05');
INSERT INTO [Terp.rank] VALUES
	('14','01','01','03','06');
INSERT INTO [Terp.rank] VALUES
	('18','01','01','03','07');
INSERT INTO [Terp.rank] VALUES
	('10','01','01','03','08');
INSERT INTO [Terp.rank] VALUES
	('39','01','01','03','09');
INSERT INTO [Terp.rank] VALUES
	('13','01','01','03','10');
INSERT INTO [Terp.rank] VALUES
	('25','01','01','03','11');
INSERT INTO [Terp.rank] VALUES
	('03','01','01','03','12');
INSERT INTO [Terp.rank] VALUES
	('11','01','01','03','13');
INSERT INTO [Terp.rank] VALUES
	('27','01','01','03','14');
INSERT INTO [Terp.rank] VALUES
	('40','01','01','03','15');
INSERT INTO [Terp.rank] VALUES
	('32','01','01','03','16');
INSERT INTO [Terp.rank] VALUES
	('50','01','01','03','17');
INSERT INTO [Terp.rank] VALUES
	('02','01','01','03','18');

--insert rank mba/2015/QS
INSERT INTO [Terp.rank] VALUES
	('38','01','02','03','01');
INSERT INTO [Terp.rank] VALUES
	('09','01','02','03','01');
INSERT INTO [Terp.rank] VALUES
	('06','01','02','03','01');
INSERT INTO [Terp.rank] VALUES
	('01','01','02','03','02');
INSERT INTO [Terp.rank] VALUES
	('13','01','02','03','03');
INSERT INTO [Terp.rank] VALUES
	('22','01','02','03','04');
INSERT INTO [Terp.rank] VALUES
	('10','01','02','03','05');
INSERT INTO [Terp.rank] VALUES
	('24','01','02','03','06');
INSERT INTO [Terp.rank] VALUES
	('18','01','02','03','07');
INSERT INTO [Terp.rank] VALUES
	('14','01','02','03','08');
INSERT INTO [Terp.rank] VALUES
	('23','01','02','03','09');
INSERT INTO [Terp.rank] VALUES
	('39','01','02','03','10');
INSERT INTO [Terp.rank] VALUES
	('25','01','02','03','11');
INSERT INTO [Terp.rank] VALUES
	('03','01','02','03','12');
INSERT INTO [Terp.rank] VALUES
	('43','01','02','03','13');
INSERT INTO [Terp.rank] VALUES
	('02','01','02','03','14');
INSERT INTO [Terp.rank] VALUES
	('32','01','02','03','15');
INSERT INTO [Terp.rank] VALUES
	('40','01','02','03','16');
INSERT INTO [Terp.rank] VALUES
	('17','01','02','03','17');
INSERT INTO [Terp.rank] VALUES
	('11','01','02','03','18');

--insert rank mba/2016/QS
INSERT INTO [Terp.rank] VALUES
	('38','01','03','03','01');
INSERT INTO [Terp.rank] VALUES
	('09','01','03','03','01');
INSERT INTO [Terp.rank] VALUES
	('06','01','03','03','01');
INSERT INTO [Terp.rank] VALUES
	('01','01','03','03','02');
INSERT INTO [Terp.rank] VALUES
	('13','01','03','03','03');
INSERT INTO [Terp.rank] VALUES
	('39','01','03','03','04');
INSERT INTO [Terp.rank] VALUES
	('18','01','03','03','05');
INSERT INTO [Terp.rank] VALUES
	('10','01','03','03','06');
INSERT INTO [Terp.rank] VALUES
	('22','01','03','03','07');
INSERT INTO [Terp.rank] VALUES
	('24','01','03','03','08');
INSERT INTO [Terp.rank] VALUES
	('23','01','03','03','09');
INSERT INTO [Terp.rank] VALUES
	('14','01','03','03','10');
INSERT INTO [Terp.rank] VALUES
	('25','01','03','03','11');
INSERT INTO [Terp.rank] VALUES
	('32','01','03','03','12');
INSERT INTO [Terp.rank] VALUES
	('03','01','03','03','13');
INSERT INTO [Terp.rank] VALUES
	('43','01','03','03','14');
INSERT INTO [Terp.rank] VALUES
	('02','01','03','03','15');
INSERT INTO [Terp.rank] VALUES
	('40','01','03','03','16');
INSERT INTO [Terp.rank] VALUES
	('17','01','03','03','17');
INSERT INTO [Terp.rank] VALUES
	('11','01','03','03','18');

--insert rank MBA/2014/eduniversity best master ranking
INSERT INTO [terp.rank] VALUES('38','01','01','04','01')
INSERT INTO [terp.rank] VALUES('01','01','01','04','02')
INSERT INTO [terp.rank] VALUES('09','01','01','04','03')
INSERT INTO [terp.rank] VALUES('24','01','01','04','04')
INSERT INTO [terp.rank] VALUES('12','01','01','04','05')
INSERT INTO [terp.rank] VALUES('25','01','01','04','06')
INSERT INTO [terp.rank] VALUES('39','01','01','04','07')
INSERT INTO [terp.rank] VALUES('13','01','01','04','08')
INSERT INTO [terp.rank] VALUES('23','01','01','04','09')
INSERT INTO [terp.rank] VALUES('32','01','01','04','10')
INSERT INTO [terp.rank] VALUES('18','01','01','04','11')
INSERT INTO [terp.rank] VALUES('10','01','01','04','12')
INSERT INTO [terp.rank] VALUES('22','01','01','04','13')
INSERT INTO [terp.rank] VALUES('28','01','01','04','14')
INSERT INTO [terp.rank] VALUES('03','01','01','04','15')
INSERT INTO [terp.rank] VALUES('02','01','01','04','16')
INSERT INTO [terp.rank] VALUES('43','01','01','04','17')
INSERT INTO [terp.rank] VALUES('40','01','01','04','18')
--insert rank MBA/2015/eduniversity best master ranking
INSERT INTO [terp.rank] VALUES('38','01','02','04','01')
INSERT INTO [terp.rank] VALUES('01','01','02','04','02')
INSERT INTO [terp.rank] VALUES('09','01','02','04','03')
INSERT INTO [terp.rank] VALUES('24','01','02','04','04')
INSERT INTO [terp.rank] VALUES('22','01','02','04','05')
INSERT INTO [terp.rank] VALUES('39','01','02','04','06')
INSERT INTO [terp.rank] VALUES('13','01','02','04','07')
INSERT INTO [terp.rank] VALUES('12','01','02','04','08')
INSERT INTO [terp.rank] VALUES('32','01','02','04','09')
INSERT INTO [terp.rank] VALUES('25','01','02','04','10')
INSERT INTO [terp.rank] VALUES('40','01','02','04','11')
INSERT INTO [terp.rank] VALUES('23','01','02','04','12')
INSERT INTO [terp.rank] VALUES('10','01','02','04','13')
INSERT INTO [terp.rank] VALUES('18','01','02','04','14')
INSERT INTO [terp.rank] VALUES('02','01','02','04','15')
INSERT INTO [terp.rank] VALUES('43','01','02','04','16')
INSERT INTO [terp.rank] VALUES('21','01','02','04','17')
--insert rank MBA/2016/eduniversity best master ranking
INSERT INTO [terp.rank] VALUES('38','01','03','04','01')
INSERT INTO [terp.rank] VALUES('01','01','03','04','02')
INSERT INTO [terp.rank] VALUES('09','01','03','04','03')
INSERT INTO [terp.rank] VALUES('24','01','03','04','04')
INSERT INTO [terp.rank] VALUES('39','01','03','04','05')
INSERT INTO [terp.rank] VALUES('22','01','03','04','06')
INSERT INTO [terp.rank] VALUES('13','01','03','04','07')
INSERT INTO [terp.rank] VALUES('32','01','03','04','08')
INSERT INTO [terp.rank] VALUES('12','01','03','04','09')
INSERT INTO [terp.rank] VALUES('25','01','03','04','10')
INSERT INTO [terp.rank] VALUES('23','01','03','04','11')
INSERT INTO [terp.rank] VALUES('10','01','03','04','12')
INSERT INTO [terp.rank] VALUES('40','01','03','04','13')
INSERT INTO [terp.rank] VALUES('18','01','03','04','14')
INSERT INTO [terp.rank] VALUES('02','01','03','04','15')
INSERT INTO [terp.rank] VALUES('43','01','03','04','16')
INSERT INTO [terp.rank] VALUES('21','01','03','04','17')
INSERT INTO [terp.rank] VALUES('44','01','03','04','18')
INSERT INTO [terp.rank] VALUES('45','01','03','04','19')
INSERT INTO [terp.rank] VALUES('46','01','03','04','20')
--insert rank IS/2014/eduniversity best master ranking
INSERT INTO [terp.rank] VALUES('02','02','01','04','01')
INSERT INTO [terp.rank] VALUES('13','02','01','04','02')
INSERT INTO [terp.rank] VALUES('12','02','01','04','03')
INSERT INTO [terp.rank] VALUES('47','02','01','04','04')
INSERT INTO [terp.rank] VALUES('49','02','01','04','05')
INSERT INTO [terp.rank] VALUES('16','02','01','04','06')
INSERT INTO [terp.rank] VALUES('11','02','01','04','07')
INSERT INTO [terp.rank] VALUES('48','02','01','04','08')
INSERT INTO [terp.rank] VALUES('15','02','01','04','09')
INSERT INTO [terp.rank] VALUES('21','02','01','04','10')
INSERT INTO [terp.rank] VALUES('07','02','01','04','11')
INSERT INTO [terp.rank] VALUES('05','02','01','04','12')
INSERT INTO [terp.rank] VALUES('52','02','01','04','13')
INSERT INTO [terp.rank] VALUES('08','02','01','04','14')
INSERT INTO [terp.rank] VALUES('51','02','01','04','15')
INSERT INTO [terp.rank] VALUES('19','02','01','04','16')
INSERT INTO [terp.rank] VALUES('57','02','01','04','17')
INSERT INTO [terp.rank] VALUES('58','02','01','04','18')
INSERT INTO [terp.rank] VALUES('50','02','01','04','19')
INSERT INTO [terp.rank] VALUES('56','02','01','04','20')
--insert rank IS/2015/eduniversity best master ranking
INSERT INTO [terp.rank] VALUES('13','02','02','04','01')
INSERT INTO [terp.rank] VALUES('02','02','02','04','02')
INSERT INTO [terp.rank] VALUES('12','02','02','04','03')
INSERT INTO [terp.rank] VALUES('47','02','02','04','04')
INSERT INTO [terp.rank] VALUES('49','02','02','04','05')
INSERT INTO [terp.rank] VALUES('16','02','02','04','06')
INSERT INTO [terp.rank] VALUES('11','02','02','04','07')
INSERT INTO [terp.rank] VALUES('48','02','02','04','08')
INSERT INTO [terp.rank] VALUES('15','02','02','04','09')
INSERT INTO [terp.rank] VALUES('21','02','02','04','10')
INSERT INTO [terp.rank] VALUES('05','02','02','04','11')
INSERT INTO [terp.rank] VALUES('07','02','02','04','12')
INSERT INTO [terp.rank] VALUES('52','02','02','04','13')
INSERT INTO [terp.rank] VALUES('51','02','02','04','14')
INSERT INTO [terp.rank] VALUES('55','02','02','04','15')
INSERT INTO [terp.rank] VALUES('50','02','02','04','16')
INSERT INTO [terp.rank] VALUES('54','02','02','04','17')
INSERT INTO [terp.rank] VALUES('04','02','02','04','18')
INSERT INTO [terp.rank] VALUES('53','02','02','04','19')
INSERT INTO [terp.rank] VALUES('56','02','02','04','20')
--insert rank IS/2016/eduniversity best master ranking
INSERT INTO [terp.rank] VALUES('13','02','03','04','01')
INSERT INTO [terp.rank] VALUES('02','02','03','04','02')
INSERT INTO [terp.rank] VALUES('12','02','03','04','03')
INSERT INTO [terp.rank] VALUES('47','02','03','04','04')
INSERT INTO [terp.rank] VALUES('16','02','03','04','05')
INSERT INTO [terp.rank] VALUES('21','02','03','04','06')
INSERT INTO [terp.rank] VALUES('11','02','03','04','07')
INSERT INTO [terp.rank] VALUES('15','02','03','04','08')
INSERT INTO [terp.rank] VALUES('48','02','03','04','09')
INSERT INTO [terp.rank] VALUES('49','02','03','04','10')
INSERT INTO [terp.rank] VALUES('50','02','03','04','11')
INSERT INTO [terp.rank] VALUES('07','02','03','04','12')
INSERT INTO [terp.rank] VALUES('05','02','03','04','13')
INSERT INTO [terp.rank] VALUES('51','02','03','04','14')
INSERT INTO [terp.rank] VALUES('52','02','03','04','15')
INSERT INTO [terp.rank] VALUES('04','02','03','04','16')
INSERT INTO [terp.rank] VALUES('53','02','03','04','17')
INSERT INTO [terp.rank] VALUES('54','02','03','04','18')
INSERT INTO [terp.rank] VALUES('55','02','03','04','19')
INSERT INTO [terp.rank] VALUES('56','02','03','04','20')

--selcte count
select count(degreeId)
from [terp.degree];
select count(locationId)
from [terp.location]
select count(*)
from [terp.own]
select count(*)
from [terp.rank]
select count(schoolId)
from [terp.school]
select count(sourceId)
from [terp.source]
select count(yearId)
from [terp.year]

--select
select rankNo, schoolName,degreeName,s.sourceName,y.yearName
from [terp.rank] r, [terp.year] y,[terp.degree] d,[terp.source] s,[terp.school] l
where d.degreeId=02
and s.sourceId=01
and y.yearId=01
and r.degreeId=d.degreeId
and r.schoolId=l.schoolId
and r.yearId=y.yearId
and r.sourceId=s.sourceId;
