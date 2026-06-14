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

CREATE TABLE Matches (
    match_id serial,
    fixture varchar(100) not null,
    tournament_category varchar(100) not null,
    base_ticket_price int not null,
    match_status varchar(20) not null,
    constraint pk_match_id primary key (match_id),
    constraint chk_ticket_price check (base_ticket_price >= 0),
    constraint chk_match_status check (match_status in ('Available', 'Sold Out'))
);

CREATE TABLE Bookings (
    booking_id serial,
    user_id int,
    match_id int,
    seat_number varchar(10) null,
    payment_status varchar(15) null,
    total_cost int not null,
    constraint pk_booking_id primary key (booking_id),
    constraint fk_user_id foreign key (user_id) references users (user_id),
    constraint fk_match_id foreign key (match_id) references matches (match_id),
    constraint chk_total_cost check (total_cost >= 0),
    constraint chk_payment_status check (payment_status in ('Confirmed', 'Pending'))
);