//
//  MockDishes.swift
//  testTask
//
//  Created by N S on 02.07.2023.
//

import Foundation

struct MockItem: Decodable {
    static let sampleItem = Item(id: 1, name: "rice", price: 799, weight: 560, description: "In china we have a lot of rice", image_url: "person", tegs: ["all menu"])
}
