require 'stringio'

class TicTacToe
    def initialize
        @board = Array.new(9)
        @players = [
            { "player" => "X", "my_turn" => true  } ,
            { "player" => "O", "my_turn" => false }
          ]
    end
    def board
        @board
    end
    
    def players
        @players
    end

    def winning_combinations
        [
            [0, 1, 2],
            [0, 4, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [2, 4, 6],
            [3, 4 ,5],
            [6, 7 ,8],
        ]
    end

    def turn 
        @turn = $stdin.gets&.chomp
        @turn ? @turn = @turn.to_i : nil
        @turn
    end

    def is_square_free
        board[turn] == nil ? true : "Please choose another square"
    end

    def check_turn
        players.select { | player | return player["player"] if player["my_turn"] == true }
    end

    def update_board(coord)
        @board = board.each_with_index.map{ | value, index | index == coord ? check_turn : value }
    end

    def update_turn
        @players = players.each{ | player | player["my_turn"] == true ?  player["my_turn"] = false : player["my_turn"] = true }
    end

    def check_winning_combo(board)
        locations_of_current_player = board.each_index.select{|i| board[i] == check_turn}
        winning_combinations.each do | combination |
          return true if (combination & locations_of_current_player) == combination
        end
        return false
    end

    def announce_winner
        "Player #{check_turn} wins!"
    end

    def full_board?
        @board.count(nil) == 0 ? true : false
    end

    def announce_draw
        "GAME OVER! It's a draw."
    end

   # check if the board is full or if there is a winning combo
   # solid state of when the game the game ends
   # otherwise do this loop:
   # while
   # update the board with the whose turn it is
   # / where they have put their move
   # check if there is a winning combo
   # if so, announce there is a winner
   # otherwise we update the turn

    # rescue => exception
        
    # end
    def play_game
        # puts $stdin.string
        while !full_board? do
            
            return @board if !turn
            puts @turn
            update_board(@turn)

            if check_winning_combo(@board)
                return announce_winner
            end

            update_turn
        end

    end
end