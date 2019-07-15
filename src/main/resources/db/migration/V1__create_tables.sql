create table countries
(
	numeric_code 		char(3)  	not null primary key,
	short_name 			text  		not null,
	full_name 			text  		not null,
	alpha_2_code 		char(2)  	not null unique,
	alpha_3_code 		char(3)  	not null unique,
	currency 			char(3)  	not null check(currency in ('840','978', '643')),
	numeric_code_1_c	text  		not null,
	english_name		text		not null,
	is_shengen			boolean  	not null
);
grant all privileges on table countries to travel_user;

create table coverage
(
	id			 		int4			not null primary key,
	name				text			not null
);
grant all privileges on table coverage to travel_user;

create table rate
(
	coverage_id 		int4 					not null references public.coverage(id),
	min_day 			int4 					not null,
	max_day				int4 					not null,
	rate 				decimal(8,2) 			not null,
	insured_sum 		decimal(9,2) 			not null,
	primary key (coverage_id, min_day, max_day, insured_sum)
);
grant all privileges on table rate to travel_user;

create table coverage_content
(
	country_code		char(3)			not null references public.countries(numeric_code),
	coverage_id			int4			not null references public.coverage(id),
	rank  				int 			not null,
	primary key (country_code, coverage_id)
);
grant all privileges on table coverage_content to travel_user;

create table accident
(
	min_day 			int4 					not null,
	max_day				int4 					not null,
	rate 				decimal(8,2) 			not null,
	insured_sum 		decimal(9,2) 			not null,
	is_abroad			boolean					not null,
	primary key (min_day, max_day, insured_sum)
);
grant all privileges on table accident to travel_user;

create table holders
(
	id 					bigserial		primary key,
	last_name 			text  			not null,
	first_name 			text  			not null,
	middle_name 		text,  					
	date_of_birth 		date  			not null,
	sex 				char(1)  		not null check(sex in ('M','F')),
	passport_serial 	text  			not null,
	passport_number		text         	not null,
	passport_issued     date 			not null,
	email 				varchar(254)	not null,
	phone 				text			not null
);
alter table holders add unique (passport_number , passport_serial);
grant all privileges on table holders to travel_user;

create table payments
(
	id							char(12)		not null primary key,
	holder_id					bigserial		not null references public.holders(id),
	time						bigint       not null,
	amount 						decimal(9,2)    not null
);
grant all privileges on table payments to travel_user;

create table contracts
(
	id 							bigserial		primary key,
	holder_id					bigint			not null references public.holders(id),
	payment_id					char(12)		null references public.payments(id),
	coverage_id					int4 			not null references public.coverage(id),
	duration					int4			not null,
	since 						date  			not null,
	till 						date  			not null,
	date						timestamp		not null,
	sport 						boolean  		not null,
	accident_sum 				decimal(9,2)    not null,
	medical_sum 				decimal(9,2)    not null,
	price               		decimal(9,2)	not null,
	price_in_rubles				decimal(9,2)	not null,
	currency            		char(3)			not null,
	number						char(10)		not null unique
);
grant all privileges on table contracts to travel_user;

create table destinations
(
	country_code				char(3)			not null references public.countries(numeric_code),
	contract_id					bigint			not null references public.contracts(id),
	primary key (country_code, contract_id)
);
grant all privileges on table destinations to travel_user;

create table travellers
(
	id 					bigserial		primary key,
	contract_id			bigint			not null references public.contracts(id),
	last_name 			text  			not null,
	first_name 			text  			not null,
	date_of_birth 		date  			not null,
	sex 				char(1)  		not null check(sex in ('M','F')),
	medical_rate		decimal(8,2)	not null,
	accident_rate		decimal(8,2)
);
grant all privileges on table travellers to travel_user;

create table next_number
(
	year					int4			not null primary key,
	next_number				int4			not null
);
grant all privileges on table next_number to travel_user;

create table history
(
	contract_id 	bigint			not null references public.contracts(id),
	edit_by			text							not null,
	edit_date 		TIMESTAMP 				not null,
	primary key (contract_id, edit_date)
);
grant all privileges on table history to travel_user;