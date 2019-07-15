create database travel_db;
create role travel_user with login password 'void';
grant all privileges on schema public to travel_user;