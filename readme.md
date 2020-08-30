# Gym Manager

Gym Manager is a basic app for a hypothetical gym to manage memberships, classes and bookings. It was built over the course of five days as a solo project at the conclusion of the first module of my CodeClan course, using Ruby (Sinatra) with a PostgreSQL database.

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

## Features


