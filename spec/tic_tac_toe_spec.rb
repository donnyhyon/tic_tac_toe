require 'stringio'

def creates_new_grid
    $board =  "\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n" 
    print $board
end

def get_input
    $stdin.gets.chomp
end

def player_move(grid , player_marker, position)
    if grid.include? position then
        print grid.gsub!(position, player_marker)
    else
        raise "it doesnt exist"
    end
end

def x_count(grid)
    grid.count('X')
end

def o_count(grid)
    grid.count('O')
end

def who_goes_next(x_count, o_count)
    if x_count > o_count then
        return 'O'
    else return 'X'
    end
  end


describe 'creating the game board' do
    it 'ACCEPTANCE TEST: creates a 3 x 3 grid with 1- 9 position indicators' do
        expect{ creates_new_grid }.to output("\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout
    end

    it 'creates a 3 x 3 grid changing position 1 into X' do
        expect{ player_move($board, 'X', '1') }.to output("\n X | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout
    end

    it 'creates a 3 x 3 grid changing position 2 into O' do
        expect{ player_move($board, 'O', '2') }.to output("\n X | O | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout
    end
end

describe 'game rules' do
    it 'displays an error when the spot is taken' do
        expect{ player_move($board, 'X', '2') }.to raise_error("it doesnt exist")
    end
end

describe "get_user_input" do
    it "returns the player's input" do
        $stdin = StringIO.new("2")
        expect(get_input).to eq("2")
    end
  end

  describe "integration tests" do
    it "passes player input into player move to put down marker" do
        $stdin = StringIO.new("5")
        user_input = get_input
        creates_new_grid
        expect{ player_move($board, 'X', user_input) }.to output("\n 1 | 2 | 3 \n 4 | X | 6 \n 7 | 8 | 9\n").to_stdout
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
