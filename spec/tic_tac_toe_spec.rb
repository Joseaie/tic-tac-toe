require_relative "../tic_tac_toe.rb"

describe "Tic Tac Toe" do
    before do
        @tic_tac_toe = TicTacToe.new
    end

    context "tests for the board" do
        it "is an array" do
            expect(@tic_tac_toe.board.class).to eq Array
        end
        
        it "has 9 elements in it" do
            expect(@tic_tac_toe.board.length).to eq 9
        end

        it "is empty" do
            expect(@tic_tac_toe.board).to all eq nil
        end
    end

    context "test for players" do
        it "exists" do
            expect(@tic_tac_toe.players).to_not be nil
        end

        it "has 2 players" do
            expect(@tic_tac_toe.players.length).to eq 2
        end

        it "contains hashes" do
            expect(@tic_tac_toe.players).to all be_a(Hash)
        end

        it "has a key with the value 'X' or 'O'" do
            expect(@tic_tac_toe.players[0]["player"]).to eq "X"
            expect(@tic_tac_toe.players[1]["player"]).to eq "O"
        end

        it "is X's turn" do
            expect(@tic_tac_toe.players[0]["my_turn"]).to eq true
        end

        it "is not O's turn" do
            expect(@tic_tac_toe.players[1]["my_turn"]).to eq false
        end
    end

    context "winning combinations" do
        it "has 8" do
            expect(@tic_tac_toe.winning_combinations.length).to eq 8
        end

        it "has 3 coordinates" do
            expect(@tic_tac_toe.winning_combinations).to all have_attributes(size: 3)
        end
    end
end