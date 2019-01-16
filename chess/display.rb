require_relative 'cursor'
require_relative 'board'
require 'colorize'

require 'byebug'

class Display
    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
        @piece_selected = false
        @selected_piece = nil
        @current_color = "white"
        # .yellow color on cursor
    end

    def render
        100.times do 
            system "clear"
            print_board
            cursor_pos = @cursor.get_input
            take_turn(cursor_pos) 
            switch_players
            # if @board.in_check?(@current_color)
            #     puts "#{@current_color}'s King is in check!"
            # end
        end
    end

    def take_turn(cursor_pos)
        unless cursor_pos.nil?
            if @piece_selected 
                @piece_selected = false
                if @selected_piece.moves.include?(cursor_pos) 
                    @board.move_piece(@selected_piece.pos, cursor_pos)
                    @selected_piece.pos = cursor_pos
                end
            else 
                @piece_selected = true
                @selected_piece = @board[cursor_pos]
            end
        end
    end

    def switch_players
        @current_color == "white" ? @current_color = "black" : @current_color = "white"
    end

    def print_board
        (0..7).each do |row|
            puts "---------------------------------"
            print "| "
            (0..7).each do |col|
                if [row, col] == @cursor.cursor_pos
                    print "#{@board.grid[row][col].symbol}".yellow  + " | "
                else
                    print "#{@board.grid[row][col].symbol}" + " | "
                end
            end
            print "\n"
        end
        puts "---------------------------------"
    end

end

board = Board.new
display = Display.new(board)
display.render