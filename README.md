## Airport Challenge

First weekend challenge at Makers coding bootcamp, this is a second iteration written after the course was finished.

This was written in an attempt to achieve the following goals:
 - I write code others can easily understand
 - I know how my language works
 - I can test-drive my code
 - I can build with objects

Written in ruby, tested with rspec.

### Running the Program

Clone this repository onto your machine, move into the folder and `bundle install`

```
$ git clone https://github.com/Mallig/airport_challenge_2_electric_boogaloo
$ cd airport_challenge_2_electric_boogaloo
$ bundle install
```

There is no UI for this program, to interact with the code open a ruby REPL and import the relevant files

```
$ irb
> require './lib/airport'
> require './lib/aeroplane'
```

After creating an airport and plane the plane can land and take off from the airport

```
> plane.land(airport)
"plane has landed at airport"
> plane.takeoff(airport)
"plane has left airport"
```

The Airport has random weather conditions which are checked each time a plane tries to land or take off, if the weather is stormy then the plane will be prevented from landing/taking off

```
> plane.land(airport)
Traceback (most recent call last):
        5: from /usr/local/bin/irb:11:in `<main>'
        4: from (irb):5
        3: from /Users/malachygilchrist/Coding/Projects/to-be-reviewed/airport_challenge/lib/aeroplane.rb:9:in `land'
        2: from /Users/malachygilchrist/Coding/Projects/to-be-reviewed/airport_challenge/lib/airport.rb:13:in `store'
        1: from /Users/malachygilchrist/Coding/Projects/to-be-reviewed/airport_challenge/lib/airport.rb:41:in `landing_errors'
RuntimeError (Stormy Weather, unsafe to land)
```

### User Stories

The following user stories, provided at the start of the challenge, were to be used to develop the program.

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Two objects stand out immediately, Aeroplane and Airport. These two classes should be capable of fulfilling all the user stories. Random weather status could be extracted into a module.

### Edge Cases

Airports should not be able to land a plane if it is already stored in the hangar, nor should they be able to release a plane that is not currently in tha hangar. Similarly, aeroplanes should not be able to land at an airport if they are already landed, nor should they be able to take off if they are already in the air. These edge cases are all accounted for and tested. 

### Making Changes

If you would like to contribute to this repository:
 - fork this reporsitory
 - make the changes
 - submit a pull request
