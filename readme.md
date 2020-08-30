# Gym Manager

Gym Manager is a basic app for a hypothetical gym to manage memberships, classes and bookings. It was built over the course of five days as a solo project at the conclusion of the first module of my CodeClan course, using Ruby (Sinatra) with a PostgreSQL database.

---

## Prerequisites

Install Ruby and PostgreSQL with Homebrew using:

```
brew install ruby
brew install postgresql
```

Install Sinatra, Sinatra-Contrib and PG with Gem using: 

```
gem install sinatra
gem install sinatra-contrib
gem install pg
```

If you also want to run the tests in models/specs, you will also need to install Minitest with Gem using:

```
gem install minitest
```

---

## Running the App

Set up the database using:
```
createdb gym
psql -d gym -f db/seeds.sql
```

Then run the app using 

```
ruby app.rb
```

The app will run on `localhost:4567`.

---

## Features

* Navigate between the main pages of the app using the top navbar.

* Full lists of members and classes can be viewed on their respective List pages.

* Enrol a new member or create a new class (including session schedule) from the List pages.

* View details of a member or class by clicking their list item.

* Edit member or class information, or delete a member or class from their details page.

* Members can be booked onto a class either from their own details page, the class details page, or the "New Booking" button in the top nav bar. Bookings can be viewed, edited or cancelled from the appropriate member/class details pages.

* On the home page, users are shown a random review generated from arrays of names and quotes.

---

## Learning Points

This was my first full project since taking up programming, and as such full of learning points. However, some key learning points include: 

* how to map between classes and a relational database;

* using a SQL Runner helper to keep CRUD methods clean;

*  how to use RESTful routes to organise behaviours in a multi-page application (including how to create a multi-page form with a single query to the database); and

* basic front-end organisation and styling with HTML and CSS.
