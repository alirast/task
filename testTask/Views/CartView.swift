//
//  CartView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI
//cart

struct CartView: View {
    var body: some View {
        VStack {
            Spacer()
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
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
