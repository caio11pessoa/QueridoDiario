//
//  Item.swift
//  QueridoDiario
//
//  Created by Caio de Almeida Pessoa on 07/01/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
