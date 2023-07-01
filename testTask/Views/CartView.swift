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
    
    @State private var number = 1
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0...5, id: \.self) { item in
                    VStack {
                        Spacer()
                        HStack {
                            
                            VStack(alignment: .leading) {
                                HStack(spacing: 3) {
                                    Spacer().frame(width: 62, height: 62).background(Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255))).cornerRadius(10).overlay {
                                        Image(systemName: "person")
                                    }
                                    VStack(alignment: .leading) {
                                        Text("Salad").font(.custom("SFProDisplay", size: 14))
                                        HStack(spacing: 3) {
                                            Text("Price₽").font(.custom("SFProDisplay", size: 14))
                                            Text("•").foregroundColor(.gray)
                                            Text("Weight").font(.custom("SFProDisplay", size: 14)).foregroundColor(.gray)
                                        }
                                        
                                    }
                                }
                            }.frame(width: 250, alignment: .leading)
                            
                            
                            VStack(alignment: .trailing) {
                                HStack {
                                    Spacer()
                                        .frame(width: 99, height: 32).background(Color(red: CGFloat(248.0/255), green: CGFloat(247.0/255), blue: CGFloat(245.0/255))).cornerRadius(10).overlay {
                                            HStack(spacing: 20) {
                                                Button(action: {
                                                    if number > 0 {
                                                        number -= 1
                                                    }
                                                }) {
                                                    Image(systemName: "minus").foregroundColor(.black)
                                                }
                                                Text("\(number)")
                                                
                                                Button(action: {
                                                    number += 1
                                                }) {
                                                    Image(systemName: "plus").foregroundColor(.black)
                                                }
                                            }
                                        }
                                }
                            }.frame(width: 100, alignment: .trailing)
                        }
                        Spacer()
                    }
                }
                
                
                
                
            }
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
            }
            .padding()
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
