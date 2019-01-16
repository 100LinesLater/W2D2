require_relative 'piece'
require 'byebug'

class Board 
    attr_reader :grid
    def initialize
        @grid = Array.new(8) {[]}
        populate
    end

    def populate
        #initialize 0th row
        @grid[0] << Rook.new(:R,"white",[0,0],self)
        @grid[0] << Knight.new(:K,"white",[0,1],self)
        @grid[0] << Bishop.new(:B,"white",[0,2],self)
        @grid[0] << King.new(:*,"white",[0,3],self)
        @grid[0] << Queen.new(:Q,"white",[0,4],self)
        @grid[0] << Bishop.new(:B,"white",[0,5],self)
        @grid[0] << Knight.new(:K,"white",[0,6],self)
        @grid[0] << Rook.new(:R,"white",[0,7],self)


        #initialize rows of Pawns
        (0..7).each do |col|
            @grid[1] << Pawn.new(:P,"white",[1, col],self)
            @grid[6] << Pawn.new(:P,"black",[6, col],self)
        end

        #initialize rows of NullPieces
        (2..5).each do |row|
            @grid[row] = Array.new(8) {NullPiece.instance}
        end

        #initialize 7th row
        @grid[7] << Rook.new(:R,"black",[7,0],self)
        @grid[7] << Knight.new(:K,"black",[7,1],self)
        @grid[7] << Bishop.new(:B,"black",[7,2],self)
        @grid[7] << King.new(:*,"black",[7,3],self)
        @grid[7] << Queen.new(:Q,"black",[7,4],self)
        @grid[7] << Bishop.new(:B,"black",[7,5],self)
        @grid[7] << Knight.new(:K,"black",[7,6],self)
        @grid[7] << Rook.new(:R,"black",[7,7],self)
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos].nil?
            raise "This starting position doesn't have a piece."
        # elsif !@grid[a, b].is_a?(NullPiece)
        #     raise StandardError
        #     puts "This ending position is already occupied."
        end

        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
        self[start_pos] = NullPiece.instance
    end

    def in_check?(color)
        king_pos = find_king(color)
        @grid.each do |row|
            row.each do |unit|
                 return true if unit.color != color && unit.moves.include?(king_pos)
            end
        end
        false
    end

    def checkmate?(color)
        valid_moves.empty? ? true : false
    end

    def valid_moves

    end

    def find_king(color)
        @grid.each do |row|
            row.each do |unit|
                return unit.pos if unit.color == color && unit.is_a?(King)
            end
        end
    end

    def []=(pos, val)
        x, y = pos 
        @grid[x][y] = val
    end

    def [](pos)
        x, y = pos 
        @grid[x][y]
    end

end