//
//  DishesModel.swift
//  testTask
//
//  Created by N S on 02.07.2023.
//

import Foundation
struct DetailedMenu: Decodable {
    let dishes: [Item]
}


struct Item: Decodable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let image_url: String
    let tegs: [String]
}
