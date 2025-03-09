//
//  CopyableAddressView.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 08/03/25.
//

import SwiftUI

struct CopyableAddressView: View {
    var body: some View {
        HStack {
            Text("0x742d35Cc6634C0532925a3b844Bc454e4438f44e".replacingRange(indexFromStart: 5, indexFromEnd: 4, replacing: "...."))
            Image(systemName: "square.on.square")
        }
    }
}

#Preview {
    CopyableAddressView()
}
