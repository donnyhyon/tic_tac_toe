require_relative '../tic_tac_toe'
require 'stringio'

describe 'playing the game ' do
    game1 = Game.new
    new_grid = game1.creates_new_grid
    it 'creates a 3 x 3 game board grid with 1- 9 position indicators' do
        expect(new_grid).to eq("\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n")
    end
    
    it 'gets player input from terminal and returns it' do
        $stdin = StringIO.new("2")
        user_input = game1.get_input
        expect(user_input).to eq("2")
    end
    
    it 'changing the board on position 1 into X' do
        board = game1.creates_new_grid
        player_turn = game1.player_move(board, 'X', '1')
        expect(player_turn).to eq("\n X | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n")
    end
    
    it 'changing the board on position 2 into O' do
        board = game1.creates_new_grid
        player_turn = game1.player_move(board, 'O', '2')
        expect(player_turn).to eq("\n 1 | O | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n")
    end

    it 'returns "game over" when all the tiles are filled' do
        board = game1.creates_new_grid
        playing_game = game1.play_game(board)
        expect(playing_game).to eq("Game Over")
# QUESTION- how do we create a test for this one - we could just add the below... 
# def play_game(board)
#     "Game Over"
# end
    end
end

describe 'game rules' do
    game1 = Game.new
    it 'displays an error when the spot is taken' do
        board = ("\n 1 | O | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n")
        expect{game1.player_move(board,'X','2')}.to raise_error("it doesnt exist")
    end

    context 'winning the game' do
        it 'wins the game with this combo' do
        end        
    end
end

describe 'swapping players' do
    game1 = Game.new
    test_board = "\n 1 | O | 3 \n 4 | X | 6 \n 7 | X | 9\n"
    x_counter = game1.x_count(test_board)
    o_counter = game1.o_count(test_board)

    it 'counts number of X & O occurences' do
        expect(x_counter).to eq(2)
        expect(o_counter).to eq(1)
    end

    it 'knows O to go when X has more counts' do
        next_player = game1.who_goes_next(2,1)
        expect(next_player).to eq('O') 
    end

    it 'knows X to go if both counts are equal' do
        next_player = game1.who_goes_next(2,2)
        expect(next_player).to eq('X') 
     end
end

describe 'integration tests' do
    game1 = Game.new
    new_grid = game1.creates_new_grid
    it "passes player input into player move to put down marker" do
        $stdin = StringIO.new("5")
        user_input = game1.get_input
        expect(game1.player_move(new_grid, 'X', user_input)).to eq("\n 1 | 2 | 3 \n 4 | X | 6 \n 7 | 8 | 9\n")
    end
end