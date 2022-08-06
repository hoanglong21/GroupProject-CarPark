CREATE DATABASE carpark

USE carpark

CREATE TABLE employee (
	employeeId					BIGINT IDENTITY(1,1)			PRIMARY KEY,
	employeeFullName			VARCHAR(50)						NOT NULL,
	account						VARCHAR(50)						NOT NULL,
	department					VARCHAR(50),
	employeeAddress				VARCHAR(50),
	employeeBirthdate			DATE							NOT NULL			CHECK (employeeBirthdate<getDATE()),
	employeeEmail				VARCHAR(50)											CHECK (employeeEmail LIKE '%_@__%.__%'),	
	employeePhone				VARCHAR(50)						NOT NULL			CHECK (employeePhone NOT LIKE '%[^0-9]%'),
	[password]					VARCHAR(100)					NOT NULL,
	sex							VARCHAR(1)						NOT NULL,
)

CREATE TABLE trip (
	tripId						BIGINT IDENTITY(1,1)			PRIMARY KEY,
	bookedTicketNumber			INT,
	carType						VARCHAR(50)						NOT NULL,
	departureDate				DATE							NOT NULL,
	departureTime				TIME							NOT NULL,
	destination					VARCHAR(50)						NOT NULL,
	driver						VARCHAR(50)						NOT NULL,
	maxiumOnlineTicketNumber	INT								NOT NULL,
)

CREATE TABLE bookingoffice (
	officeId					BIGINT IDENTITY(1,1)			PRIMARY KEY,
	officeName					VARCHAR(50)						NOT NULL,
	officePhone					VARCHAR(50)						NOT NULL,
	officePlace					VARCHAR(50)						NOT NULL,
	officePrice					BIGINT							NOT NULL,
	startContractDeadline		DATE							NOT NULL,
	endContractDeadline			DATE							NOT NULL,
	tripId						BIGINT							NOT NULL,
	FOREIGN KEY (tripId)		REFERENCES trip (tripId)
)

CREATE TABLE parkinglot (
	parkId						BIGINT IDENTITY(1,1)			PRIMARY KEY,
	parkArea					BIGINT							NOT NULL,
	parkName					VARCHAR(50)						NOT NULL,
	parkPlace					VARCHAR(50)						NOT NULL,
	parkPrice					BIGINT							NOT NULL,
	parkStatus					VARCHAR(50)
)

CREATE TABLE car (
	licensePlate				VARCHAR(50)						PRIMARY KEY,
	carColor					VARCHAR(20),
	carType						VARCHAR(50),
	company						VARCHAR(50)						NOT NULL,
	parkId						BIGINT							NOT NULL,
	FOREIGN KEY (parkId)		REFERENCES parkinglot (parkId)
)

CREATE TABLE ticket (
	ticketId					BIGINT IDENTITY(1,1)			PRIMARY KEY,
	bookingTime					TIME							NOT NULL,
	customerName				VARCHAR(50)						NOT NULL,
	licensePlate				VARCHAR(50)						NOT NULL,
	tripId						BIGINT							NOT NULL,
	FOREIGN KEY (licensePlate)	REFERENCES car (licensePlate),
	FOREIGN KEY (tripId)		REFERENCES trip (tripId)
)

-- note --
/*
	department
	company
	place
	status
*/

------------------------------------------------------ DATA ------------------------------------------------------

INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Glen Bunten', 'gbunten0', 'Business Development', '65 Dottie Road', '2020/01/21', 'gbunten0@economist.com', '3682601794', 'CdemQfZbMJ', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Karlan Abbott', 'kabbott1', 'Product Management', '2188 Anthes Pass', '2020/07/18', 'kabbott1@engadget.com', '7434073209', 'QWCiQiok', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Brandise O''Kieran', 'bokieran2', 'Sales', '2 Farragut Place', '2020/07/12', 'bokieran2@netscape.com', '7935966398', 'GhnIm5D76K', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Burtie Gingle', 'bgingle3', 'Training', '511 Dottie Junction', '2020/02/15', 'bgingle3@guardian.co.uk', '9957572330', 'XKjugQnGbq', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Zach Jessep', 'zjessep4', 'Human Resources', '1 Melvin Plaza', '2019/12/27', 'zjessep4@t-online.de', '6141633348', '5R4GjNW2', 1);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Blaine Gligori', 'bgligori5', 'Marketing', '85873 Stone Corner Park', '2020/07/27', 'bgligori5@nhs.uk', '8949885565', 'oesmvGUyYBq9', 1);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Lanie Jackes', 'ljackes6', 'Support', '43431 Loomis Circle', '2020/01/04', 'ljackes6@com.com', '2523631818', '21hxQ3', 1);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Nixie Cantrill', 'ncantrill7', 'Business Development', '20873 Luster Point', '2020/02/02', 'ncantrill7@columbia.edu', '6967603989', 'KIMO3iF', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Caralie Booi', 'cbooi8', 'Accounting', '8 Rieder Point', '2019/10/15', 'cbooi8@github.com', '6409577346', 'slwCu5hQnRzU', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Hazel McKnockiter', 'hmcknockiter9', 'Sales', '6082 Merry Circle', '2020/05/02', 'hmcknockiter9@cnn.com', '7597731981', '2FjMIqaSv73l', 1);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Avrit Sanford', 'asanforda', 'Engineering', '37544 Bonner Center', '2019/12/01', 'asanforda@twitpic.com', '8919777231', 'lICE39Ylhg', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Tanhya Epp', 'teppb', 'Accounting', '95937 Bobwhite Terrace', '2020/06/19', 'teppb@google.cn', '4739247860', 'qc34UwR', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Clarissa Petrolli', 'cpetrollic', 'Sales', '396 Fairfield Way', '2020/10/30', 'cpetrollic@liveinternet.ru', '2516686267', 'rdikMHbWEJ', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Drusi Wheelton', 'dwheeltond', 'Product Management', '60 Fremont Circle', '2019/06/21', 'dwheeltond@live.com', '2324190510', 'gAxBixQ9Y0uH', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Nikaniki Cheng', 'nchenge', 'Services', '60 Kings Pass', '2020/04/17', 'nchenge@mayoclinic.com', '6598085893', 'Z95rLkg0', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Orel Leakner', 'oleaknerf', 'Training', '55269 Loftsgordon Trail', '2019/07/23', 'oleaknerf@oracle.com', '6079788607', 'k9vwR19a', 1);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Otis Playfoot', 'oplayfootg', 'Product Management', '05 Grim Center', '2019/09/24', 'oplayfootg@goo.ne.jp', '8016830173', '0bLf81vg', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Carlin Briat', 'cbriath', 'Legal', '25 Vera Plaza', '2020/01/03', 'cbriath@comsenz.com', '4107708054', 'enMSnxI', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Corrine Shorthouse', 'cshorthousei', 'Human Resources', '3 Monica Road', '2020/07/27', 'cshorthousei@tiny.cc', '1368096125', '3kuIZyF', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Robbie Harteley', 'rharteleyj', 'Sales', '3602 Melrose Hill', '2020/10/27', 'rharteleyj@answers.com', '6812693628', '0plB0qfv1Oxr', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Barbette Mulvagh', 'bmulvaghk', 'Product Management', '87510 Bunting Street', '2019/06/28', 'bmulvaghk@amazon.com', '6446748716', 'KZtYnIEPf', 1);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Nadeen Pisco', 'npiscol', 'Training', '7680 Katie Hill', '2020/09/12', 'npiscol@bravesites.com', '8788997568', 'EQukVLnli', 1);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Mab Defew', 'mdefewm', 'Marketing', '8703 Golf Center', '2020/08/23', 'mdefewm@wunderground.com', '2044664535', 'hMHzfjup9W', 1);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Coral Norres', 'cnorresn', 'Training', '461 Main Road', '2020/09/10', 'cnorresn@liveinternet.ru', '1754941888', 'XzJvIpcFJ9', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Katha Prew', 'kprewo', 'Training', '45 Morrow Point', '2020/06/09', 'kprewo@goo.ne.jp', '5162315123', 'EwSV6lz6', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Alie Eversfield', 'aeversfieldp', 'Human Resources', '428 Troy Crossing', '2019/12/24', 'aeversfieldp@wp.com', '2159990989', 'NN0Kqs', 1);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Sharyl Dietzler', 'sdietzlerq', 'Product Management', '21 Fairview Place', '2020/03/08', 'sdietzlerq@last.fm', '1473998525', 'z2Cb5jc', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Britta Ostrich', 'bostrichr', 'Marketing', '528 Darwin Avenue', '2020/06/27', 'bostrichr@intel.com', '8941370528', 'zrMseBGIFG5', 1);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Guillema Cromie', 'gcromies', 'Training', '464 Mendota Pass', '2019/08/17', 'gcromies@nationalgeographic.com', '5452605966', 'NsbgPN3A', 0);
INSERT INTO employee (employeeFullName, account, department, employeeAddress, employeeBirthdate, employeeEmail, employeePhone, password, sex) 
VALUES ('Jessamyn Ladson', 'jladsont', 'Research and Development', '0053 Lotheville Hill', '2020/03/17', 'jladsont@oaic.gov.au', '2044955447', 'MHvpev', 0);


INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2021/08/18', '15:57', '5 Lighthouse Bay Trail', 'Cyril Piwall', 20);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'switch', '2021/10/11', '0:43', '759 Goodland Pass', 'Mandie Cant', 66);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/05/09', '18:22', '168 Badeau Park', 'Yance Haszard', 7);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'visa-electron', '2022/01/17', '22:20', '06 Claremont Crossing', 'Giordano Eltone', 79);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'bankcard', '2022/06/23', '15:49', '8 Magdeline Alley', 'Wyatt Drei', 78);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2021/09/16', '9:51', '41430 Warbler Plaza', 'Hastie Crotty', 44);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'switch', '2022/03/01', '15:40', '6549 Troy Place', 'Bennett Gumme', 24);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/03/09', '9:45', '53 Northfield Plaza', 'Trev Swadling', 10);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/06/10', '1:02', '6621 Westend Circle', 'Lem Pollard', 69);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'mastercard', '2022/06/28', '14:29', '76 Jay Park', 'Xylina Hazlehurst', 36);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'mastercard', '2022/03/01', '16:26', '3306 Mallard Point', 'Lauri Gumly', 53);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'visa', '2022/04/12', '6:05', '6890 Basil Street', 'Malissa Still', 90);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/06/04', '21:58', '2 Emmet Pass', 'Goran Burrows', 85);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'mastercard', '2021/09/17', '4:16', '584 Schiller Alley', 'Elihu Iwanowicz', 90);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'visa-electron', '2022/06/15', '5:09', '8221 Ludington Circle', 'Viviana Trunks', 46);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/01/22', '14:15', '21554 Holmberg Drive', 'Darnell Sweett', 89);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/05/16', '13:36', '14 Dapin Point', 'Aldis Seydlitz', 39);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'mastercard', '2022/02/01', '9:29', '7472 Karstens Parkway', 'Rosalinda Yusupov', 90);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'instapayment', '2021/11/16', '9:40', '88 Green Ridge Parkway', 'Devonne Sarfas', 59);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/05/29', '20:13', '7 Briar Crest Parkway', 'Amalle Chilcotte', 12);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/04/23', '17:23', '56411 Rigney Park', 'Eziechiele Chelam', 89);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/02/16', '5:37', '81746 Utah Lane', 'Chelsea Golledge', 11);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/01/08', '1:13', '47556 Brown Junction', 'Puff Reeme', 91);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/05/27', '13:45', '94 Bluestem Lane', 'Allayne De Mars', 86);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'diners-club-us-ca', '2021/09/14', '10:52', '6 Lien Trail', 'Ermina Putson', 68);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/05/27', '17:56', '24 Tony Road', 'Donella Beeke', 8);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/08/02', '19:22', '1 Hollow Ridge Junction', 'Constantina Roll', 40);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/05/20', '13:36', '5351 Marcy Avenue', 'Manya Kirvin', 68);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/04/26', '20:27', '84 Merrick Trail', 'Reynolds Dove', 58);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2021/08/27', '21:02', '01 Bluejay Road', 'Alexis Fotitt', 86);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2021/12/26', '8:14', '378 Forest Run Parkway', 'Inga Beecraft', 8);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/02/02', '10:15', '81956 Talisman Crossing', 'Dareen O''Gavin', 17);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/04/30', '22:52', '1 Loomis Center', 'Michelina Mulcahy', 67);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2021/08/29', '0:40', '41752 Quincy Parkway', 'Duff Weymont', 83);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'americanexpress', '2022/06/23', '1:53', '50 Morningstar Junction', 'Umberto Lowell', 80);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'switch', '2022/05/30', '22:50', '19376 Banding Plaza', 'Keene Fost', 68);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/03/10', '13:10', '01 Melody Street', 'Ottilie Keeley', 89);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'bankcard', '2022/07/11', '10:21', '22 Talisman Center', 'Seline Ivashnyov', 69);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/04/25', '20:01', '10293 Dorton Alley', 'Janeva Dalman', 45);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2021/11/02', '15:21', '79 Reindahl Street', 'Westbrooke Carling', 12);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/05/16', '4:48', '4934 Morrow Court', 'Malorie Vautrey', 84);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'china-unionpay', '2022/03/08', '10:29', '12 Northview Crossing', 'Raphael Mattholie', 59);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'china-unionpay', '2021/08/22', '12:43', '91903 Troy Circle', 'Ezequiel Denzey', 31);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2021/09/03', '8:25', '2 Lake View Alley', 'Roana Hazart', 52);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/03/28', '10:55', '87 Continental Trail', 'Brannon McFater', 1);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'bankcard', '2021/10/01', '2:41', '1522 Brickson Park Place', 'Raimund Syalvester', 76);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/05/06', '13:03', '9 Mandrake Way', 'Carie Insall', 51);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'diners-club-us-ca', '2022/01/04', '18:37', '2383 Lotheville Avenue', 'Libbie Raddenbury', 29);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2021/10/04', '0:50', '58413 Paget Terrace', 'Baily Sculley', 28);
INSERT INTO trip (bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) 
VALUES (0, 'jcb', '2022/08/04', '10:43', '999 Cherokee Hill', 'Aristotle Frankum', 47);


INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Einti', '9581101769', '7687 Coleman Way', 948326, '2021/04/07', '2022/06/13', 7);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Gigashots', '5524347420', '127 Clove Road', 781150, '2021/04/09', '2022/04/17', 22);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Vidoo', '8338629087', '496 Truax Avenue', 412772, '2021/04/23', '2022/03/30', 6);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Avavee', '9857801934', '48 Lakewood Gardens Hill', 860358, '2021/04/24', '2022/07/07', 44);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Jabberbean', '6515172053', '14178 Vahlen Hill', 758940, '2021/04/20', '2022/05/11', 8);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Yodel', '7322871986', '01 Haas Court', 887864, '2021/04/12', '2021/12/14', 20);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Twitterwire', '7564985440', '13 Kings Center', 491195, '2021/04/08', '2022/04/23', 37);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Jayo', '4181847695', '269 Northland Parkway', 896300, '2021/04/02', '2022/01/12', 29);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Quimm', '9941675255', '805 Maryland Circle', 231573, '2021/03/26', '2022/01/26', 10);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Fiveclub', '8192184888', '37 Calypso Drive', 573772, '2021/03/23', '2021/10/25', 29);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Zoonoodle', '7421812042', '36 Golf View Street', 957172, '2021/03/27', '2022/03/23', 42);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Aivee', '2312994331', '42903 Almo Street', 178989, '2021/04/30', '2022/06/21', 40);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Feedbug', '5724863065', '4780 Clyde Gallagher Alley', 857496, '2021/04/23', '2022/02/18', 32);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Tekfly', '3708667287', '79 Commercial Trail', 820939, '2021/04/18', '2022/04/11', 5);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Browsedrive', '1027301529', '2733 Nelson Place', 520976, '2021/04/14', '2022/01/29', 1);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Edgeify', '5464250945', '0865 Holy Cross Street', 560551, '2021/04/15', '2022/07/13', 27);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Quatz', '3195382451', '0114 Cody Crossing', 967846, '2021/04/29', '2021/11/17', 19);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Wikizz', '4255894945', '3781 Jenifer Point', 339795, '2021/05/05', '2022/05/07', 34);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Devify', '6414855293', '397 Harbort Alley', 621333, '2021/03/31', '2022/02/04', 18);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Zoomlounge', '1529973749', '4284 Myrtle Parkway', 632197, '2021/04/26', '2021/10/01', 28);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Mynte', '5872782471', '4 Meadow Vale Avenue', 588916, '2021/05/02', '2022/06/03', 10);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Photobean', '1099437941', '8449 Mendota Plaza', 666129, '2021/04/24', '2021/12/13', 35);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Browsedrive', '7127274500', '26 Anderson Pass', 788262, '2021/04/03', '2022/04/02', 14);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Twinte', '4628146579', '10335 Jackson Place', 373613, '2021/05/01', '2022/04/21', 4);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Oyoloo', '8995002421', '5052 Arrowood Junction', 868428, '2021/04/23', '2022/04/30', 24);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Gigabox', '3036173457', '84123 Onsgard Parkway', 504750, '2021/04/04', '2021/11/04', 5);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Youspan', '6557888174', '35 Declaration Trail', 970164, '2021/04/20', '2022/06/30', 10);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Camimbo', '1636197720', '3998 Sycamore Court', 149388, '2021/05/01', '2022/06/04', 15);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Avavee', '8082620573', '39892 Mifflin Junction', 276872, '2021/04/02', '2022/03/27', 23);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Yabox', '6284686674', '22380 Anhalt Avenue', 974496, '2021/04/30', '2022/04/28', 23);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Blogtags', '5767211184', '5 Merry Point', 968507, '2021/03/19', '2022/03/08', 29);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Buzzster', '2564537101', '21960 Arizona Park', 814580, '2021/03/24', '2022/02/14', 39);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Twiyo', '6567777052', '27 Continental Avenue', 758693, '2021/04/06', '2022/01/30', 31);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Devbug', '6641636703', '04 Burning Wood Park', 774758, '2021/05/11', '2022/05/28', 28);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Edgeblab', '6116820007', '2299 Waxwing Junction', 806232, '2021/04/29', '2021/11/29', 11);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Jabberbean', '2644114922', '07 Elmside Center', 819905, '2021/03/25', '2022/03/05', 20);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Katz', '2475668732', '91 Harbort Plaza', 136321, '2021/04/02', '2022/05/09', 39);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Youspan', '4369661163', '542 Shasta Place', 799744, '2021/05/10', '2022/04/11', 1);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Blogtags', '7674090914', '24 Northfield Point', 430893, '2021/03/17', '2022/06/11', 21);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Quatz', '7901236618', '3 Mariners Cove Trail', 443425, '2021/04/09', '2022/06/02', 32);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Devcast', '6018397097', '49 Lotheville Street', 360353, '2021/03/30', '2022/04/17', 24);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Reallinks', '8719649741', '58 Garrison Park', 197552, '2021/05/13', '2021/10/16', 42);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Oyoyo', '8808607430', '7900 Fallview Drive', 772636, '2021/03/29', '2022/01/30', 4);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Kwideo', '7409248070', '8158 Holmberg Plaza', 883718, '2021/05/07', '2022/01/01', 40);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Realpoint', '4172634446', '78 Hallows Street', 612102, '2021/05/05', '2022/01/29', 22);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Zoomzone', '7292908384', '504 Coolidge Park', 707210, '2021/04/01', '2022/06/13', 7);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Zoovu', '8276190285', '69 Thompson Parkway', 817710, '2021/05/09', '2021/12/18', 35);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Roombo', '1199417552', '76 Troy Lane', 410044, '2021/04/11', '2022/05/08', 50);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Jabberstorm', '2277182271', '20 Holy Cross Point', 668844, '2021/04/24', '2022/03/23', 11);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Dynazzy', '1449224298', '81528 Eliot Avenue', 243512, '2021/03/29', '2021/09/30', 21);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Fivechat', '5265188075', '72 Kensington Center', 270854, '2021/04/26', '2022/05/08', 20);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Flipbug', '6608576017', '3699 Prairie Rose Way', 622231, '2021/03/17', '2021/11/11', 44);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Mymm', '8523876818', '447 Longview Terrace', 416901, '2021/05/01', '2022/05/05', 30);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Aimbu', '2248724284', '35 Meadow Ridge Parkway', 162732, '2021/03/30', '2021/11/26', 38);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Vipe', '5839341843', '0100 Hovde Trail', 441524, '2021/03/27', '2022/04/06', 3);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Bubblebox', '6077398453', '71 Mallard Plaza', 986030, '2021/04/07', '2022/04/07', 1);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('BlogXS', '8697339170', '2 Manley Parkway', 433201, '2021/05/08', '2022/07/27', 44);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Zoomcast', '7902891672', '63 Claremont Junction', 534384, '2021/05/04', '2022/04/23', 23);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Aibox', '3869937442', '07 Orin Junction', 642429, '2021/05/04', '2022/04/27', 45);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Skimia', '4938851536', '140 Erie Point', 718594, '2021/03/18', '2022/07/07', 8);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Brainsphere', '1325934864', '65077 Walton Point', 870865, '2021/03/24', '2021/09/22', 7);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Fliptune', '9047472156', '2545 Gale Street', 791019, '2021/04/29', '2021/11/25', 2);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Jabbersphere', '1928042689', '61144 Hallows Terrace', 860985, '2021/04/16', '2022/07/13', 45);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Vitz', '8718340549', '1079 Carioca Court', 515580, '2021/04/28', '2022/03/18', 11);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Fliptune', '2914150133', '3 Dunning Park', 192860, '2021/04/07', '2022/07/10', 25);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Feednation', '5394725221', '05 Schurz Avenue', 476055, '2021/04/22', '2022/03/03', 45);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Gigabox', '7429542608', '79 Gale Point', 531749, '2021/03/17', '2022/02/07', 40);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Browseblab', '7174579159', '479 Leroy Hill', 678423, '2021/04/20', '2021/11/18', 35);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Feedspan', '4054372884', '4695 Clemons Plaza', 253405, '2021/04/15', '2022/01/20', 4);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Eayo', '9432539863', '325 8th Point', 396061, '2021/05/13', '2021/10/18', 21);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Skaboo', '9235322160', '78 Merchant Circle', 188740, '2021/03/21', '2022/07/14', 14);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('LiveZ', '6064876002', '2 5th Circle', 570934, '2021/04/01', '2022/06/20', 28);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Zoomlounge', '3826955770', '390 Hoepker Street', 456506, '2021/03/22', '2022/07/21', 34);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Lazz', '9587207666', '583 Washington Lane', 812042, '2021/05/10', '2021/12/23', 10);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Kanoodle', '2784130246', '396 Shelley Crossing', 406095, '2021/04/29', '2021/10/06', 38);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Oodoo', '9836529146', '23 Melby Alley', 921292, '2021/04/12', '2021/11/09', 14);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Edgepulse', '3276456302', '5 Moose Road', 718708, '2021/03/19', '2022/06/09', 45);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Janyx', '5519003877', '127 Sauthoff Street', 360156, '2021/05/11', '2022/07/16', 13);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Oyoloo', '8335631324', '6738 Utah Place', 517171, '2021/04/26', '2022/06/28', 17);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Devcast', '1067031969', '0386 Texas Park', 350778, '2021/03/23', '2022/01/28', 36);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Yabox', '9923329594', '4669 Garrison Point', 585513, '2021/04/17', '2021/12/21', 3);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Jazzy', '2823672585', '704 Roxbury Drive', 923606, '2021/04/04', '2022/02/26', 5);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Jayo', '3385591564', '851 Elgar Avenue', 526367, '2021/05/06', '2022/03/11', 11);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Gabcube', '5156333069', '0632 Kinsman Road', 963841, '2021/04/19', '2021/10/10', 37);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Rhybox', '5757657201', '36753 Butterfield Lane', 904030, '2021/04/05', '2022/07/31', 43);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Skipfire', '3906347089', '91197 Armistice Terrace', 918659, '2021/03/20', '2022/05/20', 2);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Leexo', '8014140298', '6031 Cascade Point', 595470, '2021/05/05', '2022/02/11', 27);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Topicblab', '2951131652', '412 Lakewood Gardens Drive', 390983, '2021/04/29', '2022/07/09', 21);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Twitterbridge', '7707276459', '40 Rowland Court', 978066, '2021/03/23', '2022/07/19', 45);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Npath', '1187621507', '3 Southridge Avenue', 867400, '2021/04/16', '2021/10/23', 34);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Feedfire', '9768947438', '6553 Redwing Point', 561954, '2021/05/03', '2021/12/21', 48);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Thoughtblab', '7271694026', '87 Lerdahl Alley', 130536, '2021/03/22', '2021/11/19', 21);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Devpoint', '6086548923', '43 Havey Hill', 366507, '2021/03/17', '2022/07/10', 16);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Omba', '3003844644', '9055 Havey Crossing', 235912, '2021/05/04', '2022/02/20', 8);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Myworks', '8318885430', '1276 Jay Parkway', 456009, '2021/03/30', '2022/02/01', 28);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('BlogXS', '6752357117', '79308 Towne Plaza', 422771, '2021/05/01', '2022/01/06', 34);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Youspan', '8722932488', '805 Bluestem Terrace', 771795, '2021/05/05', '2022/07/28', 20);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Dazzlesphere', '4196714530', '91214 Mayer Point', 827969, '2021/04/09', '2021/12/15', 28);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Tagtune', '3971294505', '5 Cottonwood Crossing', 380193, '2021/04/16', '2021/11/08', 24);
INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) 
VALUES ('Photofeed', '1899566163', '57716 Blue Bill Park Hill', 601483, '2021/04/26', '2022/08/04', 45);


INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (885, 'Y-find', '694 Darwin Center', 158, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (274, 'Alphazap', '31753 Eastlawn Pass', 244, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (889, 'Cardify', '25 Waubesa Drive', 741, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (99, 'Sonsing', '69 Daystar Parkway', 110, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (535, 'Konklab', '0927 Cody Avenue', 918, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (231, 'Rank', '5 Kennedy Street', 314, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (704, 'Bigtax', '963 Stone Corner Place', 181, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (351, 'Stim', '3 Graceland Street', 370, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (492, 'It', '5 Dottie Road', 653, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (328, 'Andalax', '06 Northport Way', 982, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (920, 'Span', '67200 Bashford Parkway', 494, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (882, 'Flowdesk', '90372 Towne Terrace', 563, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (84, 'Konklux', '87 Acker Terrace', 262, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (511, 'Ronstring', '06 Michigan Court', 267, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (403, 'Keylex', '35522 3rd Avenue', 909, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (443, 'Zaam-Dox', '6942 Stone Corner Street', 589, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (168, 'Konklab', '6428 Merry Parkway', 294, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (591, 'Rank', '421 Lakeland Avenue', 389, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (381, 'Stringtough', '31231 Anderson Crossing', 460, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (313, 'Bigtax', '036 Orin Road', 428, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (168, 'Ronstring', '34 Carey Pass', 179, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (155, 'Tresom', '667 Manitowish Hill', 560, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (518, 'Regrant', '4432 Farragut Court', 619, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (948, 'Pannier', '893 Forest Dale Center', 105, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (345, 'Aerified', '09 Myrtle Circle', 951, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (223, 'Matsoft', '6 Dayton Crossing', 119, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (378, 'Domainer', '49 Golden Leaf Place', 142, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (805, 'Lotlux', '3 Ohio Hill', 444, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (287, 'Flowdesk', '22 Crowley Drive', 194, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (936, 'Flexidy', '33 Lyons Hill', 381, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (457, 'Konklab', '8533 Blue Bill Park Pass', 93, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (565, 'Holdlamis', '48 Mayer Plaza', 681, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (741, 'Greenlam', '416 Superior Hill', 217, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (567, 'Regrant', '3 Summit Pass', 365, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (280, 'Biodex', '76200 Hollow Ridge Place', 467, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (984, 'Greenlam', '2 Logan Alley', 607, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (994, 'Veribet', '568 Cordelia Lane', 745, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (311, 'Redhold', '482 Clarendon Avenue', 215, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (677, 'Opela', '7670 Buell Terrace', 157, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (181, 'Quo Lux', '4233 Fisk Avenue', 614, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (360, 'Bamity', '721 Eagan Court', 931, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (749, 'Bytecard', '239 Clarendon Center', 480, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (240, 'Tin', '9288 Londonderry Center', 968, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (362, 'Bitwolf', '442 Express Parkway', 966, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (199, 'Zontrax', '87 Hoard Park', 458, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (445, 'Span', '75122 Hoepker Alley', 858, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (568, 'Tin', '6433 Anzinger Park', 408, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (640, 'Home Ing', '60 Larry Center', 817, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (370, 'Ronstring', '16 Sutherland Court', 862, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (67, 'Voyatouch', '41 Pine View Circle', 301, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (860, 'Viva', '25 Milwaukee Plaza', 947, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (679, 'Fix San', '43984 Blaine Crossing', 530, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (897, 'Viva', '21 Ridgeview Road', 355, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (803, 'Konklab', '35 Kings Crossing', 393, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (113, 'Konklab', '2673 Algoma Parkway', 116, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (59, 'Trippledex', '231 Eagle Crest Crossing', 183, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (58, 'Voyatouch', '44 Transport Center', 233, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (596, 'Prodder', '93 Pearson Drive', 480, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (809, 'Y-find', '292 Becker Crossing', 70, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (430, 'Vagram', '82883 Paget Court', 611, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (655, 'Sonair', '85732 Cherokee Terrace', 82, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (360, 'Span', '90 Elgar Point', 299, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (910, 'Holdlamis', '00 Maryland Park', 189, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (816, 'Namfix', '76 Manitowish Court', 282, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (234, 'Job', '9 Meadow Ridge Hill', 825, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (585, 'Y-find', '17 Merrick Junction', 634, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (707, 'Stronghold', '1 Bluejay Road', 586, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (534, 'Sonair', '9015 Buhler Center', 76, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (917, 'Zaam-Dox', '2 Basil Court', 496, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (554, 'Holdlamis', '331 4th Street', 302, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (519, 'It', '00 Bartelt Crossing', 572, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (966, 'Konklab', '277 Red Cloud Lane', 840, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (877, 'Bitchip', '5 Nova Point', 740, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (916, 'Transcof', '7 Hovde Parkway', 420, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (125, 'Span', '91 Sutherland Street', 290, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (820, 'Stim', '2929 7th Junction', 507, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (714, 'Viva', '085 Milwaukee Court', 643, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (129, 'Stronghold', '781 Melrose Court', 118, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (485, 'Zoolab', '9493 Hintze Drive', 361, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (585, 'Biodex', '4379 American Ash Junction', 91, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (783, 'Bytecard', '0 Bluejay Drive', 444, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (408, 'Stim', '5 Merchant Place', 85, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (259, 'Zaam-Dox', '7 Transport Road', 877, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (749, 'Cardguard', '9452 Merchant Center', 448, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (926, 'Bytecard', '49300 Center Center', 903, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (425, 'Bitchip', '5 Green Ridge Parkway', 983, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (725, 'Redhold', '52796 Judy Avenue', 482, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (982, 'Opela', '15961 Thierer Court', 867, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (431, 'Prodder', '50480 Erie Center', 300, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (193, 'Treeflex', '83 Golf Course Road', 610, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (357, 'Cardguard', '84 Monument Street', 443, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (829, 'Redhold', '17 Macpherson Alley', 737, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (992, 'Viva', '69420 Walton Road', 531, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (789, 'Tres-Zap', '95 Roth Drive', 676, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (605, 'Fix San', '26507 Kinsman Center', 725, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (846, 'Treeflex', '3875 Schlimgen Place', 905, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (797, 'Kanlam', '39 Longview Alley', 961, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (716, 'Fixflex', '34 American Ash Center', 608, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (733, 'Otcom', '694 Chive Parkway', 691, null);
INSERT INTO parkinglot (parkArea, parkName, parkPlace, parkPrice, parkStatus) 
VALUES (466, 'Biodex', '46 Kings Court', 897, null);


INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('130.255.52.192/10', 'Puce', '9000', 'Saab', 47);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('110.75.131.32/29', 'Puce', 'Ram Van 3500', 'Dodge', 88);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('182.176.101.43/11', 'Fuscia', 'Continental', 'Lincoln', 100);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('195.129.231.109/9', 'Turquoise', 'Galant', 'Mitsubishi', 69);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('23.208.127.191/25', 'Yellow', 'NSX', 'Acura', 5);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('158.23.64.184/1', 'Khaki', 'Escalade', 'Cadillac', 8);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('194.53.56.137/6', 'Blue', '200SX', 'Nissan', 3);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('179.187.75.190/20', 'Green', 'Cayenne', 'Porsche', 10);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('62.229.3.145/20', 'Khaki', '3500', 'Chevrolet', 19);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('132.150.49.48/22', 'Green', 'Taurus', 'Ford', 26);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('87.85.233.203/18', 'Puce', 'Landaulet', 'Maybach', 54);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('147.228.150.22/28', 'Mauv', 'Mountaineer', 'Mercury', 32);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('113.44.246.61/28', 'Indigo', 'Sixty Special', 'Cadillac', 7);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('203.80.4.19/4', 'Purple', 'Celica', 'Toyota', 35);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('53.213.83.114/15', 'Pink', '9000', 'Saab', 77);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('123.11.75.155/29', 'Blue', 'Camaro', 'Chevrolet', 29);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('173.66.36.21/15', 'Green', 'Caravan', 'Dodge', 18);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('136.12.63.158/22', 'Indigo', 'Nitro', 'Dodge', 51);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('60.254.134.15/7', 'Purple', 'Sunbird', 'Pontiac', 36);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('46.79.15.41/24', 'Green', 'Mini Cooper', 'Austin', 87);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('99.59.182.235/13', 'Yellow', 'Civic', 'Honda', 94);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('77.212.63.28/12', 'Indigo', 'Legend', 'Acura', 53);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('195.188.155.35/4', 'Teal', 'Ram Van 3500', 'Dodge', 6);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('41.134.241.22/24', 'Blue', 'Cougar', 'Mercury', 5);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('1.191.35.141/2', 'Khaki', 'Cougar', 'Mercury', 87);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('161.139.251.186/26', 'Violet', '400E', 'Mercedes-Benz', 79);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('153.188.66.158/3', 'Fuscia', 'Cayenne', 'Porsche', 70);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('151.7.125.224/28', 'Indigo', 'Grand Marquis', 'Mercury', 4);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('95.71.70.14/28', 'Purple', 'Diablo', 'Lamborghini', 96);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('189.79.141.252/21', 'Pink', '200', 'Audi', 75);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('11.57.77.38/25', 'Puce', 'Q', 'Infiniti', 82);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('168.84.1.151/9', 'Maroon', 'Silverado', 'Chevrolet', 92);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('37.201.62.16/25', 'Pink', 'Silverado Hybrid', 'Chevrolet', 94);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('42.73.177.171/12', 'Khaki', 'GS', 'Lexus', 56);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('103.180.242.81/24', 'Goldenrod', 'C70', 'Volvo', 72);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('73.82.230.179/19', 'Indigo', 'E150', 'Ford', 87);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('13.56.49.48/13', 'Teal', 'Firebird', 'Pontiac', 27);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('115.180.164.13/13', 'Green', 'Bonneville', 'Pontiac', 8);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('37.104.251.46/19', 'Green', 'RX-7', 'Mazda', 42);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('168.57.80.168/23', 'Maroon', 'Colt Vista', 'Plymouth', 36);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('82.97.128.59/29', 'Purple', 'LR3', 'Land Rover', 63);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('97.99.168.144/9', 'Mauv', 'Explorer', 'Ford', 37);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('107.71.3.210/14', 'Pink', 'MX-5', 'Mazda', 48);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('120.228.12.62/26', 'Mauv', 'Frontier', 'Nissan', 33);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('48.54.31.101/27', 'Fuscia', 'MX-5', 'Mazda', 72);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('18.131.167.201/14', 'Aquamarine', 'Truck Xtracab SR5', 'Toyota', 21);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('178.26.102.74/21', 'Aquamarine', 'Taurus', 'Ford', 86);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('235.22.90.254/14', 'Yellow', 'Century', 'Buick', 32);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('249.204.0.11/31', 'Maroon', 'Scoupe', 'Hyundai', 26);
INSERT INTO car (licensePlate, carColor, carType, company, parkId) 
VALUES ('213.27.166.29/18', 'Red', 'Navigator', 'Lincoln', 72);


INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('8:59 PM', 'Cecilia Kingzet', '123.11.75.155/29', 40);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:34 AM', 'Morey Anderton', '182.176.101.43/11', 1);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('2:36 AM', 'Flo Arnoud', '95.71.70.14/28', 13);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('9:32 AM', 'Benoit Fitchell', '87.85.233.203/18', 38);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('2:30 PM', 'Creigh Craft', '132.150.49.48/22', 31);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('5:27 AM', 'Jennica Speller', '1.191.35.141/2', 40);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:51 AM', 'Edna Feldman', '153.188.66.158/3', 19);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:23 PM', 'Suki Nobles', '173.66.36.21/15', 16);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('9:02 PM', 'Merv Darridon', '153.188.66.158/3', 14);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('11:26 PM', 'Nick Mixon', '82.97.128.59/29', 45);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:15 PM', 'Jonis Lycett', '11.57.77.38/25', 42);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('5:36 PM', 'Mercy Howells', '151.7.125.224/28', 34);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('3:18 AM', 'Olympe Valeri', '136.12.63.158/22', 19);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:19 AM', 'Marcy Hoonahan', '120.228.12.62/26', 20);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('5:43 PM', 'Lenora Matzke', '53.213.83.114/15', 47);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('11:11 AM', 'Meris Peasey', '37.201.62.16/25', 11);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('3:49 PM', 'Hobart Merigeau', '110.75.131.32/29', 42);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('9:24 AM', 'Manya Kellock', '235.22.90.254/14', 19);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:18 PM', 'Tommie Zmitrichenko', '42.73.177.171/12', 23);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:02 AM', 'Crawford Swigger', '87.85.233.203/18', 24);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('4:40 AM', 'Man Cawood', '189.79.141.252/21', 17);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:59 PM', 'Haze Northcote', '37.201.62.16/25', 44);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('4:10 PM', 'Earvin Marcroft', '99.59.182.235/13', 6);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('2:01 PM', 'Dallas Galbraith', '95.71.70.14/28', 38);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('2:15 AM', 'Bradford Rispine', '95.71.70.14/28', 27);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('3:11 AM', 'Josee Bonett', '235.22.90.254/14', 47);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:18 PM', 'Hugh Beningfield', '95.71.70.14/28', 7);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('4:44 PM', 'Kathe Stainton - Skinn', '182.176.101.43/11', 37);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('7:49 PM', 'Delaney Blais', '130.255.52.192/10', 40);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('11:42 PM', 'Larina Geater', '107.71.3.210/14', 10);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('7:52 PM', 'Cassey Jerg', '103.180.242.81/24', 30);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:45 AM', 'Tate Goley', '42.73.177.171/12', 28);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('11:12 PM', 'Nye Jennins', '60.254.134.15/7', 1);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:46 AM', 'Mona Clapham', '37.201.62.16/25', 34);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:46 PM', 'Almeta Gorcke', '13.56.49.48/13', 46);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('12:13 AM', 'Carie Sprowell', '194.53.56.137/6', 13);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('12:04 AM', 'Spencer Horbart', '41.134.241.22/24', 10);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('1:13 PM', 'Katherina Le land', '37.104.251.46/19', 30);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('9:03 PM', 'Ardelia Shellard', '77.212.63.28/12', 49);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('1:17 AM', 'Kippie Hakonsson', '158.23.64.184/1', 28);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('9:53 PM', 'Jilly Ferreras', '136.12.63.158/22', 37);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:05 PM', 'Aubine Janney', '151.7.125.224/28', 10);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('5:12 PM', 'Flss Middis', '115.180.164.13/13', 24);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('4:02 PM', 'Ginny Mariolle', '46.79.15.41/24', 15);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('4:04 AM', 'Hildegaard Abbes', '195.188.155.35/4', 9);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('1:57 PM', 'Damara McCole', '120.228.12.62/26', 50);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('4:31 AM', 'Colan Guirau', '62.229.3.145/20', 3);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('9:44 PM', 'Bailie Lyston', '168.57.80.168/23', 12);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:56 PM', 'Ryley Maplesden', '11.57.77.38/25', 27);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('11:15 PM', 'Myrlene Mesant', '110.75.131.32/29', 43);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('1:19 PM', 'Quentin Holdforth', '95.71.70.14/28', 22);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('3:56 AM', 'Claus Vairow', '194.53.56.137/6', 30);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('11:50 AM', 'Melly Piggen', '120.228.12.62/26', 38);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:13 PM', 'Jecho Pallant', '110.75.131.32/29', 24);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('7:11 AM', 'Deina Vannoort', '77.212.63.28/12', 50);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:16 PM', 'Benedick Blaik', '120.228.12.62/26', 7);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('1:58 AM', 'Juliette Surcomb', '195.129.231.109/9', 2);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('3:05 PM', 'Benedikt Janjusevic', '18.131.167.201/14', 22);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('11:50 AM', 'Yankee Corradengo', '62.229.3.145/20', 32);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('5:08 PM', 'Adorne Biscomb', '130.255.52.192/10', 47);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('12:07 PM', 'Felice O Mullen', '62.229.3.145/20', 40);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('3:53 PM', 'Janna Gonnelly', '18.131.167.201/14', 11);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('7:00 PM', 'Wade Whyborne', '235.22.90.254/14', 1);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('11:55 PM', 'Beverly Stanyan', '1.191.35.141/2', 31);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('4:06 PM', 'Niki Monshall', '1.191.35.141/2', 41);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('7:22 AM', 'Bobinette Artin', '136.12.63.158/22', 47);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:39 AM', 'Risa Betun', '13.56.49.48/13', 21);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('2:39 AM', 'Felipa Twallin', '194.53.56.137/6', 9);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('9:16 PM', 'Zuzana Ashley', '37.201.62.16/25', 5);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('7:02 PM', 'Cordi Pelz', '194.53.56.137/6', 19);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('7:08 AM', 'Teena Ludlom', '115.180.164.13/13', 46);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:43 AM', 'Perla Woodrooffe', '77.212.63.28/12', 9);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('5:08 PM', 'Lenna Storie', '179.187.75.190/20', 22);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('3:44 PM', 'Claiborn Farndale', '179.187.75.190/20', 37);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('4:35 AM', 'Marigold Kleynen', '103.180.242.81/24', 6);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:21 AM', 'Corrie Hughs', '132.150.49.48/22', 4);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('1:05 PM', 'Colan Simoens', '95.71.70.14/28', 30);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('12:20 PM', 'Averyl Matelaitis', '249.204.0.11/31', 10);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('9:21 PM', 'Christalle Riseam', '195.188.155.35/4', 11);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('11:16 AM', 'Reed Mortlock', '195.129.231.109/9', 43);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('7:40 PM', 'Nickey Doleman', '73.82.230.179/19', 4);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('9:32 AM', 'Sid Pendall', '11.57.77.38/25', 13);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('12:36 AM', 'Burl Fellgate', '161.139.251.186/26', 19);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('8:44 AM', 'Rori Gerrett', '1.191.35.141/2', 50);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:16 PM', 'Carlen Bennie', '158.23.64.184/1', 11);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('2:46 PM', 'Bobbi Quiddihy', '77.212.63.28/12', 38);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('5:12 PM', 'Braden Fowkes', '130.255.52.192/10', 37);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('2:07 PM', 'Romy Meek', '1.191.35.141/2', 18);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('7:12 AM', 'Terrill Simonnot', '123.11.75.155/29', 14);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('10:55 PM', 'Vincent O''Clery', '73.82.230.179/19', 20);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('8:03 PM', 'Wiatt Hardinge', '23.208.127.191/25', 19);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('3:18 AM', 'Tarrah Simms', '23.208.127.191/25', 10);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('12:07 PM', 'Toby Stoop', '60.254.134.15/7', 46);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('6:08 AM', 'Kerrill Kensett', '168.57.80.168/23', 32);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('4:37 AM', 'Aime De Bernardis', '168.84.1.151/9', 14);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('12:48 PM', 'Jessie Gillio', '23.208.127.191/25', 38);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('8:36 AM', 'Mala Gaskall', '23.208.127.191/25', 7);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('2:02 PM', 'Silvester Jupp', '62.229.3.145/20', 12);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('12:55 PM', 'Benetta Pedrazzi', '203.80.4.19/4', 13);
INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) 
VALUES ('4:51 AM', 'Aggi Latour', '87.85.233.203/18', 29);
