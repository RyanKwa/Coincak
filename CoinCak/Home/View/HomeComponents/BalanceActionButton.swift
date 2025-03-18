//
//  BalanceActionButton.swift
//  CoinCak
//
//  Created by mac on 10/03/25.
//

import SwiftUI

struct BalanceActionButton: View {
    var icon: String
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .padding(.vertical, 10.0)
                    .padding(.horizontal, 18.0)
                Text(text)
                    .font(.system(size: 12.0))
                    .padding(.bottom, 10)
            }.foregroundStyle(Color.black)
                .padding(10.0)
                .background(Color.gray.opacity(0.2))
        }
        
    }
}

#Preview {
    BalanceActionButton(icon: "wallet.bifold", text: "Wallet") {
        print("ButtonAction")
    }
}
