require_relative 'piece'

class Board 
    attr_reader :grid
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        populate
    end

    def populate
        @grid[0] = Array.new(8) {Piece.new}
        @grid[1] = Array.new(8) {Piece.new}
        (2..5).each do |row|
            @grid[row] = Array.new(8) {NullPiece.new}
        end
        @grid[6] = Array.new(8) {Piece.new}
        @grid[7] = Array.new(8) {Piece.new}
    end

    def move_piece(start_pos, end_pos)
        x, y = start_pos
        a, b = end_pos
        if @grid[x][y].nil?
            raise "This starting position doesn't have a piece."
        # elsif !@grid[a, b].is_a?(NullPiece)
        #     raise StandardError
        #     puts "This ending position is already occupied."
        end

        @grid[x][y], @grid[a][b] = @grid[a][b], @grid[x][y]

    end
end