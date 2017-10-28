//
//  SudokuBrain.swift
//  Sudoku
//
//  Created by labuser on 10/28/17.
//  Copyright © 2017 labuser. All rights reserved.
//

import Foundation



class SudokuBrain{
    let rows = "ABCDEFGHI"
    let cols = "123456789"
    
    

    
    private func cross(_ a:String,_ b:String)->Array<String>{
        var lst = Array<String>()
        for idxA in a.indices{
            for idxB in b.indices{
                lst.append(String(a[idxA])+String(b[idxB]))
            }
        }
        return lst
    }
    
    func getGrid()->Array<String>{
        return cross(rows,cols)
    }
    
    func getRows()->Array<Array<String>>{
        var result = Array<Array<String>>()
        for rIdx in rows.indices{
            result.append(cross(String(rows[rIdx]), cols))
        }
        return result
    }
    
//    c+row_units = [cross(r, cols) for r in rows]
//    # Element example:
//    # row_units[0] = ['A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9']
//    # This is the top most row.
//
//
//    +column_units = [cross(rows, c) for c in cols]
//    # Element example:
//    # column_units[0] = ['A1', 'B1', 'C1', 'D1', 'E1', 'F1', 'G1', 'H1', 'I1']
//    # This is the left most column.
//
//    +square_units = [cross(rs, cs) for rs in ('ABC','DEF','GHI') for cs in ('123','456','789')]
//    # Element example:
//    # square_units[0] = ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']
//    # This is the top left square.
//
//    +unitlist = row_units + column_units + square_units
    
//    ->Sarraj
//    >>> display(grid_values('..3.2.6..9..3.5..1..18.64....81.29..7.......8..67.82....26.95..8..2.3..9..5.1.3..'))
//    . . 3 |. 2 . |6 . .
//    9 . . |3 . 5 |. . 1
//    . . 1 |8 . 6 |4 . .
//    ------+------+------
//    . . 8 |1 . 2 |9 . .
//    7 . . |. . . |. . 8
//    . . 6 |7 . 8 |2 . .
//    ------+------+------
//    . . 2 |6 . 9 |5 . .
//    8 . . |2 . 3 |. . 9
//    . . 5 |. 1 . |3 . .
    
    
}
