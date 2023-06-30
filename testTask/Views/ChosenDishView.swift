//
//  ChosenDishView.swift
//  testTask
//
//  Created by N S on 30.06.2023.
//

import SwiftUI

struct ChosenDishView: View {
    let treat: Item
    @Binding var isShowingDetailView: Bool
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 25) {
                Image(systemName: "person")
                
                Text("Congrats")
                    .font(.title)
                    .foregroundColor(.pink)
                
                Text("Information about the product and the price of it")
                
                Button(action: {}) {
                    Text("Добавить в корзину")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.purple)
                    .clipShape(Capsule())
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background()
            .cornerRadius(25)
            
            Button(action: {
                withAnimation {
                   isShowingDetailView = false
                }
            }) {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.purple)
                Image(systemName: "xmark.circle")
            }
            .padding()
        }
        .frame(maxWidth: 300, maxHeight: 400)
        //.background(Color.primary.opacity(0.25))
        //.background(.regularMaterial)
        .shadow(radius: 40)
        }
    }


struct ChosenDishView_Previews: PreviewProvider {
    static var previews: some View {
        ChosenDishView(treat: MockItem.sampleItem, isShowingDetailView: .constant(true))
    }
}
