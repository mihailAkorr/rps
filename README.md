# Rock Paper Scissor

Simple rps game with web UI. Integrated CURB returns some random throw as your opponent. 

## Architecture and models

Rails: 7.0.4
Ruby: 3.1.2
TurboFrame
StimulusJS

## How to run

- Clone repo `git clone git@github.com:mihailAkorr/rps.git`

### As local rails app

- Run `bundle` 
- Run `rake db:create`
- Run `rails s`
- Navigate to `localhost:3000`

### Docker

- Run `docker-compose build`
- Run `docker-compose up`
- Navigate to `localhost:3000`

## Tests

i used rspec tests

- For docker you can use `docker-compose run -e "RAILS_ENV=test" app bundle exec rspec ./spec`
- In local `rspec ./spec`
