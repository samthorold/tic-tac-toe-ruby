print "Tic tac toe\n"

X = "x"
O = "o"
M = "."

class GameOver < StandardError
end

class Board
    def initialize(cells=nil, turn=X)
        if cells == nil
            cells = Array.new(3, Array.new(3, M))
        end
        @turn = turn
        @cells = cells
    end

    def string
        s = ""
        for row in self.rows
            for c in row
                s += c
            end
            s += "\n"
        end
        s
    end

    def move(row, col)

        # TODO: better placed in a Game class that handles inter-move logic
        sts = self.status
        if sts != M
            raise GameOver.new "Game over. " + sts + " wins."
        end

        char = @turn
        cells = Array.new
        for rw in (0..2)
            cells.push(Array.new)
            for cl in (0..2)
                if (rw == row) && (cl == col)
                    ch = char
                else
                    ch = @cells[rw][cl]
                end
                cells[rw].push(ch)
            end
        end
        if @turn == X
            turn = O
        else
            turn = X
        end
        Board.new(cells, turn)
    end

    def rows
        rws = Array.new
        for row in (0..2)
            rws.push(Array.new)
            for col in (0..2)
                rws[row].push(@cells[row][col])
            end
        end
        rws
    end

    def cols
        cls = Array.new
        for col in (0..2)
            cls.push(Array.new)
            for row in (0..2)
                cls[col].push(@cells[row][col])
            end
        end
        cls
    end

    def diags
        dgs = Array.new
        dgs.push([@cells[0][0], @cells[1][1], @cells[2][2]])
        dgs.push([@cells[2][0], @cells[1][1], @cells[0][2]])
        dgs
    end

    def status
        for player in [X, O]
            for row in self.rows
                if row.all? { |c| c == player }
                    return player
                end
            end
            for col in self.cols
                if col.all? { |c| c == player }
                    return player
                end
            end
            for diag in self.diags
                if diag.all? { |c| c == player }
                    return player
                end
            end
        end
        M
    end
end


board = Board.new

print board, "\n"

print board.string, "\n"

for row in (0..2)
    for col in (0..2)
        board = board.move(row, col)
        print board.string
        print board.status, "\n\n"
    end
end

