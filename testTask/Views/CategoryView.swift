//
//  CategoryView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI
//with categories

struct CategoryView: View {
    //@ObservedObject var viewModel: CategoryViewModel
    
    //var coordinator: CoordinatorProtocol
    
    var roundRectRequested: () -> ()
    
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
                    .onTapGesture {
                        print("tapped rounded rectangle")
                        roundRectRequested()
                    }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Image("locationPin").resizable().font(Font.system(.largeTitle).bold()).frame(width: 24, height: 24)
                
                VStack(alignment: .leading) {
                    Text("Санкт-Петербург").font(.custom("SFProDisplay", size: 18).bold())
                    Text(getCurrentDate()).font(.custom("SFProDisplay", size: 14)).foregroundColor(.gray)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("profilePicture").resizable().frame(width: 44, height: 44).clipShape(Circle()).padding(.trailing)

            }
        }
        //.navigationBarTitle("Category view")
    }
    
    
    private func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM, yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: Date())
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(roundRectRequested: {  })
        
        //let viewModel = CategoryViewModel()
        //CategoryView(viewModel: viewModel)
    }
}
