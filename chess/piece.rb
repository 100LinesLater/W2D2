require_relative 'sliding_piece_module'
require_relative 'stepping_piece_module'
require 'singleton'

require 'byebug'

class Piece
    attr_reader :symbol, :color
    attr_accessor :pos
    def initialize(symbol, color, pos, board)
        @symbol = symbol
        @color = color 
        @pos = pos
        @board = board 
    end

    def moves
        # returns array of valid positions depending on subclass movement and position on board
        []
    end
end

class NullPiece < Piece 
    include Singleton
    def initialize
        @color = "gray"
        @symbol = :_
    end
end


class Rook < Piece
    include SlidingPiece

    def moves
        pos_generator
    end

end

class Bishop < Piece
    include SlidingPiece

    def moves
        pos_generator
    end
end


class Queen < Piece
    include SlidingPiece

    def moves
        pos_generator
    end
end


class King < Piece
    include SteppingPiece

    def moves
        pos_generator
    end
end

class Knight < Piece
    include SteppingPiece

    def moves
        pos_generator
    end
end


class Pawn < Piece
    include SteppingPiece

    def moves
        pos_generator
    end
end