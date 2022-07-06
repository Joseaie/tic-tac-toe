# Tic Tac Toe
## *Unit Tests*
### Create a board

- it is empty
- 3 x 3 (one big array or nested arrays?)

### Players

- (turn counted by odd and even turns?)
- exists
- there are 2
- it is a hash
  - name (player 1/ 2) X or O
  - their turn

### Hard code winning combinations

- check there are 8
- each have 3 sets of coordinates

### Player can take a turn

- (method that allows this?) by inserting coordinates
- test by entering different coordinates
- check something is not already in the specified square
  - throw error if yes
  - check whose turn it is -> returns X or O
  - else update board with X or O
  - update turn of player in their hash
  - after each turn:
    - check if there is a winning a combination - then a player wins and game stops
    - it fills the board - finished with a draw
    - otherwise move on to next turn

### Displaying the board

- it can display the empty board
- it can add a symbol to the board and displays correctly


## *Acceptance Tests*

- I can can choose where to put my move
<!-- - After my move, I expect to see my symbol on the board -->
- I expect it to be the next player's turn and they can choose where to put their move
<!-- - After their move, I expect to see their symbol on the board too and so on -->
- After several moves if either of us have won, I expect the game to end and a message to be displayed
- I expect the game to stop if there is a draw and a message to be displayed

"   |   |   \n-----------\n   |   |   \n-----------\n   |   |   "