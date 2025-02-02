//
//  ErrorView.swift
//  Nishantkumar-Rai-Test
//
//  Created by Nishant Rai on 01/02/25.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(.red)
            .padding()
    }
}

#Preview {
    ErrorView(message: "Test Error Messages")
}
