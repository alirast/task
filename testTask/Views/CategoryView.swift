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
    let categories: [Category]
}

struct Category: Decodable, Hashable {
    let id: Int
    let name: String
    let image_url: String
}

class CategoryMainViewModel: ObservableObject {
    @Published var categories = [Category]()
    @Published var selectedCategory: Category?
    
    init() {
//TODO: - where is the data
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            //print(data)
            do {
                let mainMenu = try JSONDecoder().decode(MainScreen.self, from: data)
                print(mainMenu.categories)
                DispatchQueue.main.async {
                    self.categories = mainMenu.categories
                }
            } catch {
                print("category failed to decode \(error.localizedDescription)")
            }
        }.resume()
    }
}


struct CategoryView: View {
    @ObservedObject var viewModel = CategoryMainViewModel()
    
    //var coordinator: CoordinatorProtocol
    
    var roundRectRequested: () -> ()
    
    var body: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { category in
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(Color.red)
                    .frame(maxWidth: 343)
                    .frame(height: 148)
                    .padding(5)
                    .frame(alignment: .top)
                    .overlay {
                        VStack(alignment: .leading) {
                            Text("smth")
                        }
                    }
                    .onTapGesture {
                        print("tapped rounded rectangle")
                        roundRectRequested()
                    }
            }
        }
        .toolbar { ToolContent() }   
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(roundRectRequested: {  })
        
        //let viewModel = CategoryViewModel()
        //CategoryView(viewModel: viewModel)
    }
}
