## Airport Challenge

First weekend challenge at Makers coding bootcamp, this is a second iteration written after the course was finished.

This was written in an attempt to achieve the following goals:
 - I write code others can easily understand
 - I know how my language works
 - I can test-drive my code
 - I can build with objects

Written in ruby, tested with rspec.

### Running the Program

Clone this repository onto your machine, move into the folder `bundle install`

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

After creating an airport and plane the plane can be landed at the airport

```
> plane.land(airport)
"plane has landed at airport"
> plane.takeoff(airport)
"plane has left airport"
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
