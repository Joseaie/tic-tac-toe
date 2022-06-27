# Tic Tac Toe

## Create a board

- it is empty
- 3 x 3 (one big array or nested arrays?)

## Players

- (turn counted by odd and even turns?)
- exists
- there are 2
- it is a hash
  - name (player 1/ 2) X or O
  - their turn

## Hard code winning combinations

- check there are 8
- each have 3 sets of coordinates

## Player can take a turn

- (method that allows this?) by inserting coordinates
- test by entering different coordinates
- check something is not already in the specified square
  - throw error if yes
  - else update board with X or O
  - update turn of player in their hash
  - after each turn:
    - check if there is a winning a combination - then a player wins
    - it fills the board - finished with a draw
    - otherwise move on to next turn
