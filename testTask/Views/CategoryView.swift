//
//  CategoryView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI
//with categories

struct CategoryView: View {
    @ObservedObject var viewModel: CategoryViewModel
    var body: some View {
        Text("Category")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CategoryViewModel()
        CategoryView(viewModel: viewModel)
    }
}
