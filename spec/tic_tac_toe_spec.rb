=begin
    
PVP 
[1] - create empty 3 x 3 grid

[2] - prompt from terminal to ask for player 1 / 2 inputs. 

[3] - input into grid
input x ==> into grid

how to define location?
so what would input look like? 
- start with co-ordinates. e.g (0,1) = first row, second column. (to middle)
- 'bottom left, bottom right' - stretch goal

return new grid with previous input.

ask next player for their move. 

create a win/ loose algorithm 
-3 in a row wins. 
- how does computer see 3 in a row? 
- if all 9 squares are full, no player has 3 in a row, game is over. 

future target: PVComputer

=end

grid = ['_'] * 9
player_input = ''


# def get_input
#     player_input = gets.chomp.downcase
# end

describe "grid" do
    it "is an array" do
        expect(grid).to be_a_kind_of(Array)
    end

    it "is an array of length 9" do
        expect(grid.length).to eq(9)
    end

    # it "input is taken as a string" do
    #     expect(player1_input).to be_a_kind_of(String)
    # end
    
    # it "recognises an input" do
    #     expect(player1_input).to be_a_kind_of(String)
    # end

    # it 'should deal another card if the player hits' do
    #     allow(get_input).to receive(player_input).and_return("hello")
    #     # allow(Game).to receive(:user_input).and_return("h")
    #     # expect(game.prompt_player)
    # end

end

[0,1,2,3,4,5,6,7,8,9]
  
#   def prompt_player
#     "Hit or stand (H/S):"
#     @player_choice = user_input
#     if @player_choice == "h"
#       deal(player_hand, "Player")
#     # elsif @player_choice == "s"
#     #   #do something else
#     # else
#     #   prompt_player
#     end
#   end

#   it 'should deal another card if the player hits' do
#     allow(Game).to receive(:user_input).and_return("h")
#     expect(game.prompt_player)
#   end