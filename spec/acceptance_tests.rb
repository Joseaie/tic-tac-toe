require_relative "../tic_tac_toe.rb"
require 'stringio'

describe 'Playing the game' do
    tic_tac_toe_win = TicTacToe.new

    context 'Starting a game' do
        it 'first player can choose where to put first move' do
            $stdin = StringIO.new('4')
            expect(tic_tac_toe_win.play_game).to eq [nil,nil,nil,nil,"X",nil,nil,nil,nil]
        end

        it "I expect it to be the next player's turn and they can choose where to put their move" do
            $stdin = StringIO.new('8')
            expect(tic_tac_toe_win.play_game).to eq [nil,nil,nil,nil,"X",nil,nil,nil,"O"]
        end
    end

    context 'Winning a game' do
        it "game ends if I win and displays a message" do
            $stdin = StringIO.new('3')
            tic_tac_toe_win.play_game

            $stdin = StringIO.new('0')
            tic_tac_toe_win.play_game

            $stdin = StringIO.new('5')
            expect(tic_tac_toe_win.play_game).to eq "Player X wins!"
        end
    end
    
    tic_tac_toe_draw = TicTacToe.new
    context 'Drawing a game' do
        
        it 'game ends when board is full and there is no winner, displays draw message' do
            $stdin = StringIO.new('4')
            tic_tac_toe_draw.play_game

            $stdin = StringIO.new('2')
            tic_tac_toe_draw.play_game

            $stdin = StringIO.new('0')
            tic_tac_toe_draw.play_game

            $stdin = StringIO.new('8')
            tic_tac_toe_draw.play_game

            $stdin = StringIO.new('5')
            tic_tac_toe_draw.play_game

            $stdin = StringIO.new('3')
            tic_tac_toe_draw.play_game

            $stdin = StringIO.new('7')
            tic_tac_toe_draw.play_game

            $stdin = StringIO.new('1')
            tic_tac_toe_draw.play_game

            $stdin = StringIO.new('6')
            expect(tic_tac_toe_draw.play_game).to eq "GAME OVER! It's a draw."
        end
    end

    context "Seeing a game" do
        tic_tac_toe = TicTacToe.new
        it "displays my symbol where I put my move" do
            $stdin = StringIO.new('4')
            expect { tic_tac_toe.play_game }.to output("\n   |   |   \n-----------\n   | X |   \n-----------\n   |   |   \n").to_stdout
        end
        it "displays the winner announcement" do

            $stdin = StringIO.new('8')
            tic_tac_toe.play_game

            $stdin = StringIO.new('3')
            tic_tac_toe.play_game

            $stdin = StringIO.new('0')
            tic_tac_toe.play_game

            $stdin = StringIO.new('5')
            expect{ tic_tac_toe.play_game }.to output(/Player X wins!/).to_stdout
        end

        tic_tac_toe_2 = TicTacToe.new
        it "displays the draw announcement" do
            $stdin = StringIO.new('4')
            tic_tac_toe_2.play_game

            $stdin = StringIO.new('2')
            tic_tac_toe_2.play_game

            $stdin = StringIO.new('0')
            tic_tac_toe_2.play_game

            $stdin = StringIO.new('8')
            tic_tac_toe_2.play_game

            $stdin = StringIO.new('5')
            tic_tac_toe_2.play_game

            $stdin = StringIO.new('3')
            tic_tac_toe_2.play_game

            $stdin = StringIO.new('7')
            tic_tac_toe_2.play_game

            $stdin = StringIO.new('1')
            tic_tac_toe_2.play_game

            $stdin = StringIO.new('6')
            expect{ tic_tac_toe_2.play_game }.to output(/GAME OVER! It's a draw./).to_stdout
        end
    end

end

