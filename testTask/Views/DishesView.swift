//
//  DishesView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI
//dishes

struct DishesView: View {
    let data = Array(1...100).map({ "Item\($0)" })
    let layout = [GridItem(.adaptive(minimum: 90))]
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(0..<10) { i in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray).brightness(0.4)
                            .frame(width: 100, height: 50)
                    }
                }
            }.padding(.horizontal)
            
            ScrollView {
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(data, id: \.self) { item in
                        Text(item)
                    }
                }.padding(.bottom)
            }
        }
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
    }
}
