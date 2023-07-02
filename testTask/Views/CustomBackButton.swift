//
//  CustomBackButton.swift
//  testTask
//
//  Created by N S on 02.07.2023.
//

import SwiftUI

struct NavBackButton: View {
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.backward").foregroundColor(.black)
        }
    }
}
