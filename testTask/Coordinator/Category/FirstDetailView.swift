//
//  FirstDetailView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI

struct FirstDetailView: View {
    @ObservedObject var viewModel: CategoryViewModel
    
    var body: some View {
        VStack {
            Text("first detail screen")
            TextField("name", text: $viewModel.name).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("email", text: $viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView(viewModel: CategoryViewModel())
    }
}
