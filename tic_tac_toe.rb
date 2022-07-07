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

    def display_board(board)
        show_board = board.map { |element| element == nil ? " " : element}
        
        puts "\n", " #{show_board[0]} | #{show_board[1]} | #{show_board[2]} \n-----------\n #{show_board[3]} | #{show_board[4]} | #{show_board[5]} \n-----------\n #{show_board[6]} | #{show_board[7]} | #{show_board[8]} "
        " #{show_board[0]} | #{show_board[1]} | #{show_board[2]} \n-----------\n #{show_board[3]} | #{show_board[4]} | #{show_board[5]} \n-----------\n #{show_board[6]} | #{show_board[7]} | #{show_board[8]} "
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
        return nil if !@turn

        is_value_within_bounds(@turn)
       
        @turn = @turn.to_i

        is_square_free(@turn)
        @turn
    end

    def is_square_free(val)
        unless board[val] == nil
            puts "Please choose another square"
            turn
        end
        val
    end

    def is_value_within_bounds(val)
        unless val =~ /^[0-9]$/
           puts "Please enter a number between 0 and 8"
           turn
        end
        val
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
        while !full_board? do
            
            return @board if !turn

            update_board(@turn)
            display_board(@board)

            if check_winning_combo(@board)
                puts announce_winner
                return announce_winner
            end

            update_turn
        end
        puts announce_draw
        announce_draw
    end
end


tic_tac_toe = TicTacToe.new
tic_tac_toe.play_game