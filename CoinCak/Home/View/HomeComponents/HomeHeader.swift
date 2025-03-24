//
//  HomeHeader.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 01/03/25.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        VStack {
            HStack {
                Image("App-logo")
                Spacer()
                CurrentWalletView(walletName: "Ethereum Mainnet", walletLogo: "diamond")
            }
            .padding(EdgeInsets(top: 24.0, leading: 20.0, bottom: 24.0, trailing: 20.0))
            Divider()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HomeHeader()
}
