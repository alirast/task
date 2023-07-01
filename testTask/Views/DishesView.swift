//
//  DishesView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI
import Combine
//dishes

//mock items
struct MockItem: Decodable {
    static let sampleItem = Item(id: 1, name: "rice", price: 799, weight: 560, description: "In china we have a lot of rice", image_url: "person", tegs: ["all menu"])
}

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



class GridViewModel: ObservableObject {
    
    @Published var dishes = [Item]()
    @Published var selectedDish: Item?
    @Published var isShowingDetailView = false
    @Published var tegs = [String]()
    
    init() {
        var urlArray = [String]()
            guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                //check response
                do {
                    let menu = try JSONDecoder().decode(DetailedMenu.self, from: data)
                    DispatchQueue.main.async {
                        self.dishes = menu.dishes
                        
                        for dish in menu.dishes {
                            urlArray.append(contentsOf: dish.tegs.map({ String($0) }))
                            self.tegs = Array(Set(urlArray)).sorted(by: <)
                        }
                    }
                } catch {
                    print("failed to decode \(error.localizedDescription)")
                }
            }.resume()
        }
    }


struct DishesView: View {
    
    @ObservedObject var vm = GridViewModel()
    @State private var selectedTag: String?
    //@StateObject var ord = Order()
   
    let data = Array(1...100).map({ "Item\($0)" })
    let layout = [GridItem(.adaptive(minimum: 90), alignment: .top)]
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        ForEach(vm.tegs.indices, id: \.self) { tegIndex in
                            let teg = vm.tegs[tegIndex]
                                RoundedRectangle(cornerRadius: 15)
                                .fill(selectedTag == teg ?  Color(uiColor: UIColor(red: CGFloat(51.0/255), green: CGFloat(100.0/255), blue: CGFloat(224.0/255), alpha: 1.0)) : Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255)))
                                    .frame(width: 80, height: 35)
                                    .overlay {
                                        VStack(alignment: .leading) {
                                            Text(teg).foregroundColor(selectedTag == teg ? Color.white : Color.black).font(.custom("SFProDisplay", fixedSize: 14))
                                        }
                                    }

                                    .onTapGesture {
                                    selectedTag = teg
                                        print("selected tag: \(vm.tegs[tegIndex])")
                                    }
                   

                        }
                    }
                }.padding(.horizontal)
        
                
                ScrollView {
                    LazyVGrid(columns: layout, spacing: 10) {
                        ForEach(vm.dishes, id: \.self) { dish in
                            VStack(alignment: .leading, spacing: 4) {
                                Spacer()
                                    .frame(width: 109, height: 109)
                                    .background(Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255)))
                                    .background(Color.gray)
                                    .cornerRadius(10)
                                    .overlay {
                                        AsyncImage(url: URL(string: dish.image_url)) { image in
                                            image.resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 79, maxHeight: 88, alignment: .center)
                                        } placeholder: {
                                            Image(systemName: "photo.on.rectangle.angled")
                                        }
                                    }
                                
                                Text(dish.name)
                                    .font(.custom("SFProDisplay", fixedSize: 14)).frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .onTapGesture {
                                print("CHOSEN")
                                vm.selectedDish = dish
                                vm.isShowingDetailView = true
                            }
                            .padding(.horizontal) //can remove it to make blue big
                            //.background(Color.red) //removed it to make it without red
                        }
                    }.disabled(vm.isShowingDetailView).padding(.bottom)
                        .padding(.horizontal, 10)
                }.blur(radius: vm.isShowingDetailView ? 20 : 0)

                
                
            }
            if vm.isShowingDetailView {
                if let selectedItemInMenu = vm.selectedDish {
                    ChosenDishView(treat: selectedItemInMenu, isShowingDetailView: $vm.isShowingDetailView)//.environmentObject(ord)
                    //ChosenDishView(treat: vm.selectedDish!, isShowingDetailView: $vm.isShowingDetailView)
                }
            }
            
        }
   
        .toolbar {
            CategoryToolbar()
            
        }
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
    }
}
