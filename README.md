# bws-mars-rover

For ruby 1.8.7

# Example runs

## Example 1

    neo:mars-rover kayo$ cat sample-input.txt | ruby mars-mission.rb
    1 3 N
    5 1 E

    Debug output:
    reading input...
    top_right: 5 5
    rover0: 1 2 N: LMLMLMLMM
    rover1: 3 3 E: MMRMMRMRRM
    rover0 moves: 1 2 N, 1 2 W, 0 2 W, 0 2 S, 0 1 S, 0 1 E, 1 1 E, 1 1 N, 1 2 N, 1 3 N
    rover1 moves: 3 3 E, 4 3 E, 5 3 E, 5 3 S, 5 2 S, 5 1 S, 5 1 W, 4 1 W, 4 1 N, 4 1 E, 5 1 E
    

## Example 2 (Test out of bounds)

    neo:mars-rover kayo$ cat sample-input-2.txt | ruby mars-mission.rb
    Initial position out of bound: 100 0 W
    rover 2: out of bounds
    1 3 N
    5 1 E
    1 6 N
    
    Debug output:
    reading input...
    top_right: 5 5
    rover0: 1 2 N: LMLMLMLMM
    rover1: 3 3 E: MMRMMRMRRM
    rover2: 5 0 W: MMMMRMMMMMMMMMMM
    rover0 moves: 1 2 N, 1 2 W, 0 2 W, 0 2 S, 0 1 S, 0 1 E, 1 1 E, 1 1 N, 1 2 N, 1 3 N
    rover1 moves: 3 3 E, 4 3 E, 5 3 E, 5 3 S, 5 2 S, 5 1 S, 5 1 W, 4 1 W, 4 1 N, 4 1 E, 5 1 E
    rover2 moves: 5 0 W, 4 0 W, 3 0 W, 2 0 W, 1 0 W, 1 0 N, 1 1 N, 1 2 N, 1 3 N, 1 4 N, 1 5 N, 1 6 N
    neo:mars-rover kayo$ 

## Changes

### Tue Oct 28 13:09:19 IST 2014

 + Added unit tests using Test::Unit::TestCase
 + minor cleanup
