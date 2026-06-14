DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    user_id serial,
    full_name varchar(50) not null,
    email varchar(50) not null,
    role varchar(50) not null,
    phone_number varchar(20),
    constraint pk_user primary key (user_id),
    constraint unique_user_email unique (email),
    constraint ck_role check (role in ('Football Fan', 'Ticket Manager'))
);