//
//  SwapView.swift
//  CoinCak
//
//  Created by mac on 19/03/25.
//

import SwiftUI

struct SwapView: View {
    var body: some View {
        VStack {
            InputAmountView()
        }
    }
}

struct InputAmountView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                VStack(alignment: .leading, spacing: 32.0) {
                    Text("From")
                    CurrentWalletView(walletName: "BTC", walletLogo: "diamond")
                        .padding(.leading, -8.0)
//                        .background(Color.blue)
                }
//                .background(Color.red)
                
                Spacer()
                Divider()
                Spacer()
                
                VStack(alignment: .trailing, spacing: 32.0) {
                    Text("10,00")
                        .font(.system(size: 32.0, weight: .regular))
                    Text("Balance = 2")
                        .font(.system(size: 12.0, weight: .regular))
                    
                }
//                .background(Color.blue)
            }
            .padding(16.0)
            .frame(height: 120.0)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            HStack {
                Text("1 BTC = 6 CXTC")
                Image(systemName: "repeat")
            }
        }.padding(.horizontal, 20.0)
    }
}



#Preview {
    SwapView()
}
