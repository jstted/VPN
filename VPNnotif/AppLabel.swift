//
//  AppLabel.swift
//  VPNnotif
//
//  Created by Mikhail Tedeev on 08.06.2024.
//

import SwiftUI

struct AppLabel: View {
    @Binding var isConnected: Bool
    
    var body: some View {
        Image(isConnected ? .vpNon : .vpNoff)
    }
}

#Preview {
    AppLabel(isConnected: .constant(true))
}
