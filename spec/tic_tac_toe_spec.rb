require_relative '../tic_tac_toe'

describe 'playing the game ' do
    it 'creates a 3 x 3 game board grid with 1- 9 position indicators' do
        expect{ creates_new_grid }.to output("\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout
    end

    it 'gets player input from terminal and returns it' do
        $stdin = StringIO.new("2")
        expect(get_input).to eq("2")
    end

    it 'changing the board on position 1 into X' do
        expect{ player_move($board, 'X', '1') }.to output("\n X | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout
    end

    it 'changing the board on position 2 into O' do
        expect{ player_move($board, 'O', '2') }.to output("\n X | O | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout
    end
end

describe 'game rules' do
    it 'displays an error when the spot is taken' do
        expect{ player_move($board, 'X', '2') }.to raise_error("it doesnt exist")
    end

    context 'winning the game' do
        it 'wins the game with this combo' do
        end        
    end
end

describe 'swapping players' do
    test_board = "\n 1 | O | 3 \n 4 | X | 6 \n 7 | X | 9\n"
    it 'counts number of X & O occurences' do
        expect(x_count(test_board)).to eq(2)
        expect(o_count(test_board)).to eq(1)
    end

    it 'knows O to go when X has more counts' do
       expect(who_goes_next(2,1)).to eq('O') 
    end

    it 'knows X to go if both counts are equal' do
        expect(who_goes_next(2,2)).to eq('X') 
     end
end

describe 'integration tests' do
    it "passes player input into player move to put down marker" do
        $stdin = StringIO.new("5")
        user_input = get_input
        creates_new_grid
        expect{ player_move($board, 'X', user_input) }.to output("\n 1 | 2 | 3 \n 4 | X | 6 \n 7 | 8 | 9\n").to_stdout
    end
end