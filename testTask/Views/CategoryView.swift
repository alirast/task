//
//  CategoryView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI

struct CategoryView: View {
    @ObservedObject var viewModel = CategoryMainViewModel()
    var roundRectRequested: (_ name: String) -> ()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.categories, id: \.self) { category in
                    ZStack(alignment: .topLeading) {
                        AsyncImage(url: URL(string: category.image_url)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 343, maxHeight: 148, alignment: .center)
                        } placeholder: {
                            Image(systemName: "photo.on.rectangle.angled")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 343, height: 148)
                        }
                        Text(category.name)
                            .padding(.leading, 16)
                            .padding(.top, 12)
                            .lineLimit(2)
                            .font(.custom("SFProDisplay", size: 20).bold())
                    }
                    .onTapGesture {
                        print("tapped rounded rectangle")
                        roundRectRequested(category.name)
                    }
            }
        }
        .toolbar { ToolContent() }  
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(roundRectRequested: { name in })
    }
}
