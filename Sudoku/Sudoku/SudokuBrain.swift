//
//  SudokuBrain.swift
//  Sudoku
//
//  Created by labuser on 10/28/17.
//  Copyright © 2017 labuser. All rights reserved.
//

import Foundation



class SudokuBrain{
    private var rows = "ABCDEFGHI"
    private var cols = "123456789"
    private var boxes = [""]
    private var rowUnits = [[""]]
    private var columnUnits = [[""]]
    private var squareUnits = [[""]]
    private var gridValue = ["":""]
    
    var size:UInt{
        get{
            return UInt(cols.count)
        }
        set(value){
            if isSquareAndSmall(value){//only supports non-zero square values and fits A-Z (upto 26x26)
                cols = ""
                rows = ""
                for index in 1...value{
                    cols = cols + String(index)
                }
                rows = String("ABCDEFGHIJKLMNOPQRSTUVWXYZ".dropLast(26 - Int(value)))
                boxes = getGrid()
                rowUnits = getRowUnits()
                columnUnits = getColumnUnits()
                squareUnits = getSquareUnits()
                gridValue = ["":""]
            }
        }
    }
    
    private func isSquareAndSmall(_ number:UInt)->Bool{
        let double = Double(number)
        let isSquare =  double.squareRoot().rounded() == double.squareRoot()
        let isSmall = double.squareRoot() <= 26 //A-Z
        return isSmall && isSquare && number > 0
    }

    
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
    
    func getRowUnits()->Array<Array<String>>{
        var result = Array<Array<String>>()
        for rIdx in rows.indices{
            result.append(cross(String(rows[rIdx]), cols))
        }
        return result
    }
    
    func getColumnUnits()->Array<Array<String>>{
        return [[""]]
    }
    
    func getSquareUnits()->Array<Array<String>>{
        return [[""]]
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
    
    func gridValue(_ str:String)->Dictionary<String,String>{
        var dict = Dictionary<String,String>()
        for (a,b) in zip(getGrid(),str){
            dict[a] = String(b)
        }
        return dict
    }
    
    // These functions are mistakenly shifting locations
    // TODO: need to create value arrays to be shifted
//    func shiftRow(atIndex index:UInt, by shift:Int){
//        let shiftValue = shift % Int(size)
//        rowUnits[Int(index)].rotate(positions:-shiftValue)
//    }
//    func shiftColumn(atIndex index:UInt, by shift:Int){
//        let shiftValue = shift % Int(size)
//        columnUnits[Int(index)].rotate(positions:-shiftValue)
//    }
}

extension Array {
    mutating func rotate(positions: Int, size: Int? = nil) {
        guard positions < count && (size ?? 0) <= count else {
            print("invalid input1")
            return
        }
        if positions < 0{
            let secondPositions = -positions
            
            reversed(start: 0, end: (size ?? count) - 1)
            reversed(start: 0, end: secondPositions - 1)
            reversed(start: secondPositions, end: (size ?? count) - 1)
        }else{
            reversed(start: 0, end: positions - 1)
            reversed(start: positions, end: (size ?? count) - 1)
            reversed(start: 0, end: (size ?? count) - 1)
        }
    }
    mutating func reversed(start: Int, end: Int) {
        guard start >= 0 && end < count && start < end else {
            return
        }
        var start = start
        var end = end
        while start < end, start != end {
            self.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}
