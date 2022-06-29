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
    $stdin = StringIO.new("2")

    it "returns the player's input" do
      expect(get_input).to eq("2")
    end
  end


  describe "integration tests" do
    it "passes player input into player move to put down marker" do
        
    end
  end




