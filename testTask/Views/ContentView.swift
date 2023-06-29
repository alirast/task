//
//  ContentView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI
//navigation view
//dont need it

struct ContentView: View {

    
 
    var body: some View {
        //Text("Swiftui content view")
        TabView {
            Text("FirstView")
            Button("second", action: {
 
            })
                .padding()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                .tag(1)
            Text("SecondView")
                .padding()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
