require 'stringio'

class Game
    def initialize
        @board = ""
    end
    
    def creates_new_grid
        @board =  "\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n" 
        @board
    end
    
    def get_input
        # $stdin.gets
        $stdin.gets.chomp
    end
    
    def player_move(grid , player_marker, position)
        if grid.include? position then
            grid.gsub!(position, player_marker)
        else
            puts "that doesn't exist- try again"
            get_input

        end
    end
    
    # def x_count(grid)
    #     grid.count('X')
    # end
    
    # def o_count(grid)
    #     grid.count('O')
    # end
    
    # def who_goes_next(x_count, o_count)
    #     if x_count > o_count then
    #         return 'O'
    #     else return 'X'
    #     end
    # end
    
    def play_game(board)
        player_marker = 'X'
        count = 0
        while count < 9  
            position = get_input
            player_move(board, player_marker, position)
            print board
            count += 1
            if player_marker == 'X' then
                player_marker = 'O'
            else
                player_marker = 'X'
            end
        end
        puts "Game Over"
    end
end

game1 = Game.new
grid = game1.creates_new_grid
game1.play_game(grid)