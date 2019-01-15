require_relative 'cursor'
require_relative 'board'
require 'colorize'

class Display
    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
        # .yellow color on cursor
    end

    def render
        4.times do 
            system "clear"
            print_board
            @cursor.get_input
        end
    end

    def print_board
        (0..7).each do |row|
            (0..7).each do |col|
                if [row, col] == @cursor.cursor_pos
                    print "#{@board.grid[row][col]}".yellow 
                else
                    print @board.grid[row][col]
                end
            end
            print "\n"
        end
        40.times {print "-"}
    end
end

board = Board.new
display = Display.new(board)
display.render