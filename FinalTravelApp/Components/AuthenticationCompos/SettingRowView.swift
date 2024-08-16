//
//  SettingRowView.swift
//  Final Travel App
//
//  Created by chandana on 14/04/24.
//

import SwiftUI

struct SettingRowView: View {
    
    let systemImageName: String
    let actionTitle: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: systemImageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            Text(actionTitle)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingRowView(systemImageName: "arrow.left", actionTitle: "sign out", tintColor: .gray)
}
