//
//  Array+Only.swift
//  Memorize
//
//  Created by SimranJot Singh on 31/05/20.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }    
}
