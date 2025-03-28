//
//  TokenBalanceSection.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 26/03/25.
//

import SwiftUI

struct TokenBalanceSection: View {
    var hideBottomSection: Bool = false
    @State var text: String = ""
    var inputIdentifier: String = ""
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                VStack(alignment: .leading, spacing: 32.0) {
                    Text("From")
                    CurrentWalletView(walletName: "BTC", walletLogo: "diamond")
                        .padding(.leading, -8.0)
                }
                Spacer()
                Divider()
                Spacer()
                VStack(alignment: .trailing, spacing: 32.0) {
                    CustomTextField(text: $text, shouldSupressKeyboard: true, placeholder: "")
                        .lineLimit(1)
                    Text("Balance = 2")
                        .font(.system(size: 12.0, weight: .regular))
                }
                .padding(.leading, 4.0)
            }
            .padding(16.0)
            
            .frame(height: 120.0)
            .frame(maxWidth: UIScreen.main.bounds.width)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            if !hideBottomSection {
                HStack {
                    Text("1 BTC = 6 CXTC")
                    Spacer()
                    Image(systemName: "repeat")
                }
                .frame(maxWidth: .infinity, minHeight: 32.0)
            }
        }.padding(.horizontal, 20.0)
    }
}

#Preview {
    TokenBalanceSection()
}
