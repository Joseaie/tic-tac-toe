require_relative "../tic_tac_toe.rb"
require 'stringio'

describe "Tic Tac Toe" do

    tic_tac_toe = TicTacToe.new

    context "tests for the board" do
        it "is an array" do
            expect(tic_tac_toe.board.class).to eq Array
        end
        
        it "has 9 elements in it" do
            expect(tic_tac_toe.board.length).to eq 9
        end

        it "is empty" do
            expect(tic_tac_toe.board).to all eq nil
        end
    end

    context "test for players" do
        it "exists" do
            expect(tic_tac_toe.players).to_not be nil
        end

        it "has 2 players" do
            expect(tic_tac_toe.players.length).to eq 2
        end

        it "contains hashes" do
            expect(tic_tac_toe.players).to all be_a(Hash)
        end

        it "has a key with the value 'X' or 'O'" do
            expect(tic_tac_toe.players[0]["player"]).to eq "X"
            expect(tic_tac_toe.players[1]["player"]).to eq "O"
        end

        it "is X's turn" do
            expect(tic_tac_toe.players[0]["my_turn"]).to eq true
        end

        it "is not O's turn" do
            expect(tic_tac_toe.players[1]["my_turn"]).to eq false
        end
    end

    context "winning combinations" do
        it "has 8" do
            expect(tic_tac_toe.winning_combinations.length).to eq 8
        end

        it "has 3 coordinates" do
            expect(tic_tac_toe.winning_combinations).to all have_attributes(size: 3)
        end
    end

    context "taking a turn" do
        it "receives coordinates" do
            $stdin = StringIO.new('4')
            expect(tic_tac_toe.turn).to eq 4
        end
        it "checks something is not already in the specified square" do
            $stdin = StringIO.new('4')
            expect(tic_tac_toe.is_square_free).to be true
        end

        it "checks whose turn it is" do
            expect(tic_tac_toe.check_turn).to eq "X" 
        end

        it "updates the board" do
            expect(tic_tac_toe.update_board(4)).to eq [nil,nil,nil,nil,"X",nil,nil,nil,nil]
        end

        it "updates the user's turn" do
            expect(tic_tac_toe.update_turn).to eq [{"my_turn"=>false, "player"=>"X"}, {"my_turn"=>true, "player"=>"O"}]
        end

        it "returns an error message if square is occupied" do
            $stdin = StringIO.new('4')
            expect(tic_tac_toe.is_square_free).to eq "Please choose another square"
        end
    end

    context "after each turn" do
        it "returns false if there is not a winning combination" do 
            expect(tic_tac_toe.check_winning_combo(tic_tac_toe.board)).to be false
        end 

        it "returns true if there is a winning combination" do 
            expect(tic_tac_toe.check_winning_combo(["O","O","O",nil,"X",nil,nil,"X",nil])).to be true
        end

        it "announces winner" do
            winner = tic_tac_toe.check_winning_combo(["O","O","O",nil,"X",nil,nil,"X",nil])
            if winner
                expect(tic_tac_toe.announce_winner).to eq "Player O wins!"
            end
        end

        it "checks if board is full" do
            expect(tic_tac_toe.full_board?).to be false
        end

        it "announces draw" do
            expect(tic_tac_toe.announce_draw). to eq "GAME OVER! It's a draw."
        end
    end
end