//
//  Array+Only.swift
//  Memorise
//
//  Created by 0507 on 01/06/2020.
//  Copyright © 2020 0507spc. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
