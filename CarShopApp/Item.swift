//
//  Item.swift
//  CarShopApp
//
//  Created by Yordan Iturra Correa on 15-02-25.
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
