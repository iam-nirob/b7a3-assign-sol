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
    constraint chk_match_status check (match_status in ('Available', 'Sold Out', 'Selling Fast'))
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

INSERT INTO Users (user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);

INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');

INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);

select fixture, base_ticket_price from matches where tournament_category = 'Champions League';

select user_id, match_id, coalesce(payment_status, 'Action Required') as systematic_status from bookings;