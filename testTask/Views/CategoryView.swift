//
//  CategoryView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI
//with categories

struct MockCategory: Decodable {
    static let sampleCategory = Category(id: 1, name: "Mor", image_url: "person")
}

struct MainScreen: Decodable {
    let сategories: [Category]
}

struct Category: Decodable, Hashable {
    let id: Int
    let name: String
    let image_url: String
}

class CategoryMainViewModel: ObservableObject {
    @Published var categories = [Category]()

    init() {
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            //print(data)
            do {
                let mainMenu = try JSONDecoder().decode(MainScreen.self, from: data)
                print(mainMenu.сategories)
                DispatchQueue.main.async {
                    self.categories = mainMenu.сategories
                }
            } catch {
                print("category failed to decode \(error.localizedDescription)")
            }
        }.resume()
    }
}


struct CategoryView: View {
    @ObservedObject var viewModel = CategoryMainViewModel()
    var roundRectRequested: (_ name: String) -> ()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.categories, id: \.self) { category in
                    ZStack(alignment: .topLeading) {
                        AsyncImage(url: URL(string: category.image_url)) { image in
                            image.resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 343, maxHeight: 148, alignment: .center)
                        } placeholder: {
                            Image(systemName: "photo.on.rectangle.angled").resizable().aspectRatio(contentMode: .fit).frame(width: 343, height: 148)
                        }
//Text(category.name)
                       
                        Text(category.name).padding(.leading, 16).padding(.top, 12).lineLimit(2).font(.custom("SFProDisplay", size: 20).bold())
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
        
        //let viewModel = CategoryViewModel()
        //CategoryView(viewModel: viewModel)
    }
}
