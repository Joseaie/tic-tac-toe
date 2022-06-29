require_relative "../tic_tac_toe.rb"
require 'stringio'

describe 'Starting the game' do
    tic_tac_toe = TicTacToe.new

    it 'first player can choose where to put first move' do
        $stdin = StringIO.new('4')
        expect(tic_tac_toe.play_game).to eq [nil,nil,nil,nil,"X",nil,nil,nil,nil]
    end

    it "I expect it to be the next player's turn and they can choose where to put their move" do
        $stdin = StringIO.new('8')
        expect(tic_tac_toe.play_game).to eq [nil,nil,nil,nil,"X",nil,nil,nil,"O"]
    end

    it "game ends if I win and displays a message" do
        io = StringIO.new('3')
        io.puts('0')
        io.puts('5')
        $stdin = io
        expect(tic_tac_toe.play_game).to eq "Player X wins!"
    end
end