create table car (
    car_uid UUID NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19, 2) NOT NULL
);

create table person (
    person_uid UUID NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    birth DATE NOT NULL,
    country VARCHAR(50) NOT NULL,
    car_uid UUID REFERENCES car (car_uid),
    UNIQUE(car_uid)
);

insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Noam', 'Hawkridge', 'Male', '2003-07-28', 'nhawkridge0@example.com', 'Indonesia');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Lulita', 'Duckit', 'Female', '2001-02-12', 'lduckit1@over-blog.com', 'Indonesia');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Rodrick', 'Rabbitts', 'Male', '2002-08-18', 'rrabbitts2@csmonitor.com', 'Germany');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Tatum', 'Belt', 'Female', '2001-03-20', null, 'China');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Lemmy', 'Napoleone', 'Male', '2003-05-23', 'lnapoleone4@wikispaces.com', 'Russia');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Barny', 'Gentil', 'Male', '2001-10-21', null, 'China');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Putnam', 'Abbison', 'Male', '2002-09-03', 'pabbison6@t-online.de', 'Poland');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Nalani', 'Mazonowicz', 'Female', '2003-02-01', 'nmazonowicz7@ucla.edu', 'United States');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Terri-jo', 'Pendleberry', 'Female', '2002-09-19', null, 'Russia');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Gwen', 'Philott', 'Female', '2002-08-02', null, 'Palestinian Territory');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Alejandrina', 'Venes', 'Female', '2002-09-06', null, 'China');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Aile', 'Tonge', 'Polygender', '2000-11-18', 'atongeb@slashdot.org', 'China');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Arabella', 'Gouldthorpe', 'Non-binary', '2001-04-12', 'agouldthorpec@addtoany.com', 'Japan');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Iseabal', 'Creek', 'Female', '2000-10-01', 'icreekd@answers.com', 'United Kingdom');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Lynea', 'Skipper', 'Female', '2001-02-15', 'lskippere@fastcompany.com', 'Colombia');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Domeniga', 'Daniely', 'Female', '2000-12-28', 'ddanielyf@senate.gov', 'China');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Phebe', 'Bythway', 'Female', '2001-10-22', 'pbythwayg@hubpages.com', 'Japan');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Bridgette', 'Dilks', 'Female', '2001-09-30', 'bdilksh@simplemachines.org', 'Poland');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Egbert', 'Dubery', 'Male', '2002-12-24', null, 'Brazil');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Arlette', 'Vickar', 'Female', '2002-04-02', 'avickarj@booking.com', 'Indonesia');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Tad', 'Somersett', 'Male', '2003-02-20', 'tsomersettk@taobao.com', 'France');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Tobit', 'Vipan', 'Male', '2003-03-04', null, 'Philippines');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Fancie', 'Downes', 'Non-binary', '2003-01-27', null, 'Brazil');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Ali', 'Drysdell', 'Female', '2002-08-01', null, 'Albania');
insert into person (person_uid, first_name, last_name, gender, birth, email, country) values (uuid_generate_v4(),'Maritsa', 'Thynne', 'Female', '2001-01-10', null, 'Indonesia');

insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Buick', 'Regal', '4701.38');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Chevrolet', 'Suburban 1500', '4604.21');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Toyota', 'Tacoma', '8537.86');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Rambler', 'Classic', '9354.00');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Volkswagen', 'Touareg', '7822.99');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Chevrolet', 'Camaro', '4299.11');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'GMC', 'Savana 1500', '8211.08');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'BMW', 'M5', '4149.59');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Audi', 'A7', '8787.88');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Chevrolet', 'TrailBlazer', '9545.97');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Ford', 'F150', '5201.84');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Pontiac', 'Bonneville', '7933.59');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Pontiac', 'Fiero', '8059.06');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Mazda', 'Protege', '8523.89');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Oldsmobile', 'Bravada', '3217.52');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Jaguar', 'S-Type', '2729.94');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Ram', '3500', '6382.66');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Cadillac', 'XLR-V', '6305.14');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Ford', 'LTD Crown Victoria', '3275.61');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Volvo', 'S80', '2238.34');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'BMW', '330', '7490.03');