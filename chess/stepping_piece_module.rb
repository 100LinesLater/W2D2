module SteppingPiece

    def move_dirs
        if self.class == King
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
        elsif self.class == Knight
            [
                [2, 1],
                [2, -1],
                [1, 2],
                [1, -2],
                [-1, -2],
                [-2, -1],
                [-1, 2],
                [-2, 1]
            ]
        else # Pawn-Z scheme
            [
                [0,1]
            ]
        end
    end

    def pos_generator
        res = []
        move_dirs.each do |increment|
            x, y = pos
            a, b = increment
            next if @board[[x + a, y + b]].nil?
            if @board[[x + a, y + b]].is_a?(NullPiece) || @board[[x + a, y + b]].color != color
                res << [x + a, y + b]
            end
        end
        res
    end
    
    
end