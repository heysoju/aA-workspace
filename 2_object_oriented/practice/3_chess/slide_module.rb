module Slideable

    def top_left_diagonal(pos)
        possible_moves = []
        x, y = pos
        until x <= 0 || y <= 0
            possible_moves << [x - 1, y - 1] if x - 1 >= 0 && y - 1 >= 0
            x -= 1
            y -= 1
        end
        possible_moves
    end

    def top_right_diagonal(pos)
        possible_moves = []
        x, y = pos
        until x <= 0 || y >= 7
            possible_moves << [x - 1, y + 1] if x - 1 >= 0 && y + 1 <= 7
            x -= 1
            y += 1
        end
        possible_moves
    end

    def bottom_left_diagonal(pos)
        possible_moves = []
        x, y = pos
        until x >= 7 || y <= 0
            possible_moves << [x + 1, y - 1] if x + 1 <= 7 && y - 1 >= 0
            x += 1
            y -= 1
        end
        possible_moves
    end

    def bottom_right_diagonal(pos)
        possible_moves = []
        x, y = pos
        until x >= 7 || y >= 7
            possible_moves << [x + 1, y + 1] if x + 1 <= 7 && y + 1 <= 7
            x += 1
            y += 1
        end
        possible_moves
    end

    def top_center(pos)
        #until row 0

    end

    def bottom_center(pos)
        #until row 7
    end


    def left_center(pos)
        #until col 0

    end

    def right_center(pos)
        #until col 7

    end

    def diagonal_moves(pos)
        top_left = top_left_diagonal(pos)
        top_right = top_right_diagonal(pos)
        bottom_left = bottom_left_diagonal(pos)
        bottom_right = bottom_right_diagonal(pos)
        [top_left, top_right, bottom_left, bottom_right]
    end

    def horizonal_vertical_moves(pos)

    end

end