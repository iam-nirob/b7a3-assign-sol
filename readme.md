# Football Ticket Booking Practice Query

This assignment contains a PostgreSQL practice script for a simple football ticket booking system.

## What the script does

The SQL file creates three tables:

- `Users` for fan and manager account details
- `Matches` for match information, ticket price, and match status
- `Bookings` for ticket reservations and payment details

It also adds sample data for users, matches, and bookings, then runs a set of practice queries to demonstrate common SQL operations.

## Main SQL topics covered

- `CREATE TABLE` and `DROP TABLE`
- Primary key, foreign key, and unique constraints
- `CHECK` constraints for valid values
- `INSERT` statements with sample records
- Filtering with `WHERE`
- Pattern search with `ILIKE`
- `COALESCE` for missing values
- `INNER JOIN` and `LEFT JOIN`
- Subquery with `AVG()`
- `ORDER BY`, `LIMIT`, and `OFFSET`

## Example output goals

The queries are written to show:

- Champions League matches and ticket prices
- Users whose names match specific patterns
- Booking payment status with a fallback label
- Booking details joined across users and matches
- Users with and without bookings
- Bookings that cost more than the average booking cost
- The second and third highest ticket prices

## How to run

Run the SQL script in any PostgreSQL environment, such as pgAdmin or a PostgreSQL terminal session.
