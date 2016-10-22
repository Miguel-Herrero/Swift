var board = [[String]](repeating: [String](repeating: "", count: 10), count: 5)

board[2][1] = "x"

rowLoop: for (rowIndex, cols) in board.enumerated() {
    for (colIndex, col) in cols.enumerated() {
        if col == "x" {
            print("Found the treasure at row \(rowIndex) col \(colIndex)!")
            break rowLoop
        }
    }
}