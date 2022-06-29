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
        4
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
end





