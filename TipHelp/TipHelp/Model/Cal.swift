//
//  Cal.swift
//  TipHelp
//
//  Created by Sai Naveen Katla on 07/09/20.
//  Copyright © 2020 Sai Naveen Katla. All rights reserved.
//

import Foundation

struct Cal {
    
    var value: Float = 0.0
    
    mutating func calculateTotal(amt: Float, tip: Float, split: Int) -> Float {
        let total = (amt + (amt * tip))
        
        return value
    }

    func getvalue() -> Float {
        return value
    }
}
