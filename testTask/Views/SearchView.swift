//
//  SearchView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI
//search

struct SearchView: View {
    var body: some View {
        Text("Search View")
            
            .toolbar {
                ToolContent()
            }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
