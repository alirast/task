//
//  CategoryToolbar.swift
//  testTask
//
//  Created by N S on 02.07.2023.
//


import SwiftUI

struct CategoryToolbar: ToolbarContent {
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Image("profilePicture")
                .resizable()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
                .padding(.trailing)
        }
    }
        
}
