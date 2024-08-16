//
//  ShoeType.swift
//  ARStore
//
//  Created by Smit Patel on 11/08/24.
//

import Foundation
import SwiftUI

struct Shoe: Identifiable, Codable {
    var id = UUID()
    var imageName: String
    var name: String
    var price: Double
    var rating: Float
    var category: ShoeCategory
    var usdzFileName: String
    var model: Model?
    
    var image: Image {
        Image(imageName)
    }

    init(imageName: String, name: String, price: Double, rating: Float, category: ShoeCategory, usdzFileName: String) {
        self.imageName = imageName
        self.name = name
        self.price = price
        self.rating = rating
        self.category = category
        self.usdzFileName = usdzFileName
        self.model = Model(modelName: usdzFileName)
    }

    private enum CodingKeys: String, CodingKey {
        case id, imageName, name, price, rating, category, usdzFileName
    }
}

enum ShoeCategory: String, Codable {
    case lifestyle
    case running
    case tennis
}


struct ShoeStore {
    var shoes: [Shoe]
    
    var lifestyleShoesCount: Int {
        shoes.filter { $0.category == .lifestyle }.count
    }
    
    var runningShoesCount: Int {
        shoes.filter { $0.category == .running }.count
    }
    
    var tennisShoesCount: Int {
        shoes.filter { $0.category == .tennis }.count
    }
}

let shoeStore = ShoeStore(shoes: [
    Shoe(imageName: "lifestyle1", name: "Air Max 97", price: 300.0, rating: 4.8, category: .lifestyle, usdzFileName: "lifestyle1_usdz"),
    Shoe(imageName: "lifestyle2", name: "React Presto", price: 120.0, rating: 4.5, category: .lifestyle, usdzFileName: "AirForce1XCA"),
    Shoe(imageName: "lifestyle3", name: "Nike Legend", price: 140.0, rating: 4.2, category: .lifestyle, usdzFileName: "lifestyle1_usdz"),
    Shoe(imageName: "lifestyle4", name: "Nike Retro", price: 110.0, rating: 4.6, category: .lifestyle, usdzFileName: "lifestyle1_usdz")
])

