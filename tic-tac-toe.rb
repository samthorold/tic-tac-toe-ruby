print "Tic tac toe\n"

X = "x"
O = "o"
M = "."

def string(board)
    s = ""
    for row in board
        for c in row
            s += c
        end
        s += "\n"
    end
    s
end

def move(board, row, col, char)
    board = board.map(&:clone)
    board[row][col] = char
    board
end

def row(board, i)
    board[i]
end

def col(board, i)
    cl = Array.new
    for row in (0..2)
        cl.push(board[row][i])
    end
    cl
end

def diag(board, top_left)
    if top_left
        return [board[0][0], board[1][1], board[2][2]]
    end
    [board[2][0], board[1][1], board[0][2]]
end

def status(board)
    # check for row-wise 3 in a row
    for player in [X, O]
        for rw in (0..2)
            if row(board, rw).all? { |c| c == player }
                return player
            end
        end
        # check for col-wise 3 in a row
        for cl in (0..2)
            if col(board, cl).all? { |c| c == player }
                return player
            end
        end
        # check for diagonal 3 in a row
        if diag(board, true).all? { |c| c == player }
            return player
        end
        if diag(board, false).all? { |c| c == player }
            return player
        end
    end
    M
end

board = Array.new(3, Array.new(3, M))

print board, "\n"

print string(board), "\n"

board = move(board, 0, 0, X)
print string(board)
print status(board), "\n\n"

board = move(board, 0, 1, X)
print string(board)
print status(board), "\n\n"

board = move(board, 0, 2, X)
print string(board)
print status(board), "\n\n"

