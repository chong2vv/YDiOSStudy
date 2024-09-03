//
//  Iterator.swift
//  YDiOSStudy
//
//  Created by 王远东 on 2024/8/28.
//

import Foundation

class stateItr: IteratorProtocol {
    var num:Int = 1
    func next() -> Int? {
        num += 2
        return num
    }
    func findNext() {
         
    }
}
