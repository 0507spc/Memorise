//
//  Array+Identifiable.swift
//  Memorise
//
//  Created by 0507 on 29/05/2020.
//  Copyright © 2020 0507spc. All rights reserved.
//

import Foundation

// Constrain array to element
extension Array where Element: Identifiable {
    //Gain the firstIndex (optional -> ?)
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        //return 0 // TODO: bogus
        return nil
    }
}
