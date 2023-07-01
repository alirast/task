//
//  CartView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI
//cart

struct CartView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        VStack {
            Spacer()
            
            List {
                ForEach(order.items, id: \.self) { treat in
                    Text("treat")
                }
                .onDelete(perform: order.deleteItems)
            }
            .listStyle(.plain)
            
            if order.items.isEmpty {
                Text("you have nothing to pay for")
            }
            
            Button {
                print("Оплатить")
            } label: {
                Text("Оплатить \(order.totalPrice, specifier: "%.2f")")
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
