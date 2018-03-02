# Oystercard #

---

#### By Raefe and George ####

In this project we created a fully functioning Oystercard program as part of Makers
week 2. Our program contained 4 classes: an Oystercard class (has a balance and handles touching in and touching out), a Station (with a name and a zone), a JourneyLog class (starts/ends journeys, saves journey history and handles edge cases) and a Journey class (has a start/end, can calculate its own fare and knows if it's complete).

## Getting Started ##

Ruby version:
```
2.5.0
```
Run:
```
bundle install
```
## Running the tests ##
The tests are separated by classes.
To run them all at once, type:
```
rspec
```
To run them individually, type:
```
rspec spec/oystercard_spec.rb
rspec spec/station_spec.rb
rspec spec/journey_log_spec.rb
rspec spec/journey_spec.rb
```
## Built with ##

- [Atom](https://atom.io/) - text editor

## Contributors ##

- Raefe
- George
