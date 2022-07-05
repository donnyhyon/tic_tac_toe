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
