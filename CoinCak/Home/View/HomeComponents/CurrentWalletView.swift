//
//  CurrentWalletView.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 01/03/25.
//

import SwiftUI

struct CurrentWalletView: View {
    var walletName: String = ""
    var walletLogo: String = ""
    var body: some View {
        
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6.0)
                    .fill(Color.purple.opacity(0.2))
                    .frame(width: 28, height: 28)
                Image(systemName: walletLogo)
                    .resizable()
                    .frame(width: 10, height: 10)
            }
            Text(walletName)
                .font(.system(size: 12))
            ZStack {
                RoundedRectangle(cornerRadius: 6.0)
                    .fill(Color.clear)
                    .frame(width: 28, height: 28)
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 15, height: 10)
            }
        }
        .padding(8.0)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))

    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CurrentWalletView(walletName: "Ethereum Mainnet", walletLogo: "diamond.fill")
        
}
