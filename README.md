## War or Peace


War or Peace is an simulation of the classic card game War.


## Readme Content

-   [Getting Started](#getting-started)
-   [Gameplay Example](#gameplay-example)
-   [Running the Tests](#running-the-tests)
-   [Authors](#authors)



## Getting Started

    $ cd to a directory of your choice
    $ git clone git@github.com:danceofdisillusion/war_or_peace.git
      # or fork and then clone your own fork
    $ cd war_or_peace

### Prerequisites

-   Ruby 2.5.3

### Installing

#### Install gems and setup your database:

    bundle install

## Gameplay Example
```
Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------
```
```
Turn 1: Megan won 2 cards
Turn 2: WAR - Aurora won 6 cards
Turn 3: *mutually assured destruction* 6 cards removed from play
...
...
...
Turn 9324: Aurora won 2 cards
*~*~*~* Aurora has won the game! *~*~*~*
```
Or there may not be a winner

```
Turn 1: Megan won 2 cards
Turn 2: WAR - Aurora won 6 cards
Turn 3: *mutually assured destruction* 6 cards removed from play
...
...
...
Turn 1000000: Aurora won 2 cards
---- DRAW ----
```

## Starting the game:

    ruby war_or_peace_runner.rb


## Running the Tests

-   Run with $ bundle exec rspec. All tests should be passing.
-   You can also run $ bundle exec rspec /path




## Authors

-   Michelle Randolph | [github](https://github.com/danceofdisillusion) \| [linkedin](https://www.linkedin.com/in/michelle-randolph/)


