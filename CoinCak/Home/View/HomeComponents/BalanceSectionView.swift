//
//  BalanceSectionView.swift
//  CoinCak
//
//  Created by mac on 07/03/25.
//

import SwiftUI

struct BalanceSectionView: View {
    @State var isShowBalance: Bool = false
    var body: some View {
        VStack {
            HStack {
                TotalBalanceView()
                Spacer()
                CopyableAddressView()
            }.padding(.horizontal, 20.0)
            BalanceInfoView()
            HStack(spacing: 0) {
                Group {
                    BalanceActionButton(icon: "arrow.up", text: "Send") {
                        print("Send")
                    }
                    BalanceActionButton(icon: "arrow.down", text: "Receive")  {
                        print("Recieve")
                    }
                    BalanceActionButton(icon: "arrow.left.arrow.right", text: "Swap")  {
                        print("Swap")
                    }
                    BalanceActionButton(icon: "wallet.pass", text: "Buy/Sell")  {
                        print("Buy/Sell")
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .padding(.horizontal, 20.0)
            .padding(.bottom, 24.0)
            Divider()
        }
    }
}

#Preview {
    BalanceSectionView()
}
