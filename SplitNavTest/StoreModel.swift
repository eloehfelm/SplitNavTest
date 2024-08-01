//
//  StoreModel.swift
//  SplitNavTest
//
//  Created by Erik Loehfelm on 7/31/24.
//

import Foundation
import SwiftUI

struct Store: Codable, Identifiable, Hashable {
    var id: UUID { UUID() }
    var name: String
    var categories: [Category]
    var vendors: [Vendor]
}

struct Category: Codable, Identifiable, Hashable {
    var id: UUID { UUID() }
    var name: String
    var categoryItems: [CategoryItem]
}

struct CategoryItem: Codable, Identifiable, Hashable {
    var id: UUID { UUID() }
    var name: String
    var items: [Item]
}

struct Item: Codable, Identifiable, Hashable {
    var id: UUID { UUID() }
    var name: String
    var description: String
    var price: Double
    var vendorId: Int
}

struct Vendor: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var contactNumber: String
}
