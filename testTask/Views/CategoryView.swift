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
        ScrollView {
            ForEach(0..<5) { item in
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(Color.red)
                    .frame(maxWidth: 343)
                    .frame(height: 148)
                    .padding(5)
                    .overlay {
                        VStack(alignment: .leading) {
                            Text("id name")
                        }
                    }
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CategoryViewModel()
        CategoryView(viewModel: viewModel)
    }
}
