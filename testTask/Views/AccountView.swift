//
//  AccountView.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        Text("Account View")
            .toolbar {
                ToolContent()
            }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
