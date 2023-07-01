//
//  CartView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI
//cart

struct CartView: View {
    //@EnvironmentObject var order: Order
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person")
                    VStack {
                        Text("Salad")
                        Text("Price")
                    }
                }
            }.frame(width: 300, alignment: .leading)
            
            Spacer()
            
            List {
                ForEach(0...5, id: \.self) { treat in
                    Text("treat")
                }
                //.onDelete(perform: order.deleteItems)
            }
            .listStyle(.plain)
            
            //if order.items.isEmpty {
                Text("you have nothing to pay for")
            //}
            
            Button {
                print("Оплатить")
            } label: {
                Text("Оплатить")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }.padding(.bottom)
            

        }

        
        .toolbar {
            ToolContent()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
