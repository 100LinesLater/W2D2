module SlidingPiece


    def move_dirs
        if self.class == Rook
             [
                [0, -1],
                [0, 1],
                [-1, 0],
                [1, 0]
             ]
        elsif self.class == Bishop
            [
                [-1, -1],
                [1, -1],
                [-1, 1],
                [1, 1]
            ]
        else
            [
                [0, -1],
                [0, 1],
                [-1, 0],
                [1, 0],
                [-1, -1],
                [1, -1],
                [-1, 1],
                [1, 1]
             ]
        end
    end

    def generator_rec(position, increment) #return 2D array
        return [[]] unless @board[position].is_a?(NullPiece) || @board[position].color != color
        x, y = position
        a, b = increment

        [position] + generator_rec([x + a, y + b], increment)
    end

    def pos_generator
        res = []
        move_dirs.each do |increment|
            x, y = pos
            a, b = increment
            next if @board[[x + a, y + b]].nil?
            res += generator_rec([x + a, y + b], increment)
        end
        res.select{|arr| arr.length > 0}
    end

end