class TicTacToe
    def board
        Array.new(9)
    end
    
    def players
        [ { "player" => "X", "my_turn" => true  } ,
          { "player" => "O", "my_turn" => false}
        ]
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
end





