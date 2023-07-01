//
//  ChosenDishView.swift
//  testTask
//
//  Created by N S on 30.06.2023.
//

import SwiftUI

struct ChosenDishView: View {
    //@ObservedObject var viewModel: GridViewModel
    let treat: Item
    @Binding var isShowingDetailView: Bool
    @EnvironmentObject var order: Order
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 25) {
                Spacer()
                    .frame(width: 300, height: 300)
                    .background(Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255)))
                    .cornerRadius(10)
                    .overlay {
                        AsyncImage(url: URL(string: treat.image_url)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 79,
                                       maxHeight: 88,
                                       alignment: .center)
                        } placeholder: {
                            Image(systemName: "photo.on.rectangle.angled")
                        }
                    }
                HStack {
                    Text("\(treat.price)₽")
                    Text("•")
                    Text("\(treat.weight)г")
                }
    
                Text(treat.name)
                Text(treat.description)
                
                Button(action: {
                    order.add(treat)
                    isShowingDetailView = false
                }) {
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
                Image(systemName: "heart")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                Image(systemName: "xmark").font(.system(size: 28, weight: .bold)).foregroundColor(.black)
            }
            .padding(.all)
        }
        .frame(maxWidth: 300, maxHeight: 400)
        .shadow(radius: 40)
        }
    
    }


struct ChosenDishView_Previews: PreviewProvider {
    static var previews: some View {
        ChosenDishView(treat: MockItem.sampleItem, isShowingDetailView: .constant(true))
    }
}
