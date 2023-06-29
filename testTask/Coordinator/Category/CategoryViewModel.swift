//
//  CategoryViewModel.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
}
