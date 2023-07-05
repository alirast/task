//
//  ChosenDishView.swift
//  testTask
//
//  Created by N S on 30.06.2023.
//

import SwiftUI
import UIKit

class Some {
    var items = [Item]()

    
    func getItems(_ items: [Item]) {
        self.items = items

    }
}



class ChosenDishCoordinator: ObservableObject {
  
    @Published var selectedDishes: [Item] = []
    @Published var isCartEmpty = true
    var cartCoordinator = CartCoordinator()
    var some = Some()
    
    func addToCart(dish: Item) {
        
        cartCoordinator.getName(dish.name)
        isCartEmpty = false
        selectedDishes.append(dish)
        print("selected dishes \(selectedDishes)")
        some.getItems(selectedDishes)
        
    }
}


struct ChosenDishView: View {
    let treat: Item
    @Binding var isShowingDetailView: Bool
    @StateObject private var coordinator = ChosenDishCoordinator()
    
 
 
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 2) {
                ZStack(alignment: .topTrailing) {
                    Spacer()
                        .frame(width: 311, height: 232)
                        .background(Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255)))
                        .cornerRadius(10)
                        .overlay {
                            AsyncImage(url: URL(string: treat.image_url)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 198,
                                           maxHeight: 204,
                                           alignment: .center)
                            } placeholder: {
                                Image(systemName: "photo.on.rectangle.angled")
                            }
                        }
                    
                    HStack(spacing: 5) {
                        Spacer()
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "heart")
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(.black)
                                }
                            }
                        Spacer()
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay {
                                Button {
                                    isShowingDetailView = false
                                } label: {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(.black)
                                }
                            }
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(treat.name)
                        .font(.custom("SFProDisplay", size: 16).bold())
                    HStack {
                        Text("\(treat.price)₽")
                            .font(.custom("SFProDisplay", size: 14))
                        Text("•")
                        Text("\(treat.weight)г")
                            .font(.custom("SFProDisplay", size: 14))
                            .foregroundColor(.gray)
                    }
                    
                    Text(treat.description)
                        .font(.custom("SFProDisplay", size: 14))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(width: 311, alignment: .leading)
                
                Spacer()
                
                Button {
               
                    isShowingDetailView = false
                    //coordinator.isCartEmpty = false
                    coordinator.addToCart(dish: treat)
                    //coordinator.selectedDishes = coordinator.$selectedDishes
                    coordinator.$selectedDishes.sink { selectedDishes in
              
                    }
                    
             
                } label: {
                    Text("Добавить в корзину")
                        .foregroundColor(.white)
                        .font(.custom("SFProDisplay", size: 16))
                }
                    .frame(width: 311, height: 48)
                    .background(Color(uiColor: UIColor(red: CGFloat(51.0/255), green: CGFloat(100.0/255), blue: CGFloat(224.0/255), alpha: 1.0)))
                    .cornerRadius(10)

            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background()
            .cornerRadius(10)
        }
        .frame(maxWidth: 343, maxHeight: 446)
        .shadow(radius: 40)
        }

    }


struct ChosenDishView_Previews: PreviewProvider {
    static var previews: some View {
        ChosenDishView(treat: MockItem.sampleItem, isShowingDetailView: .constant(true))
    }
}
