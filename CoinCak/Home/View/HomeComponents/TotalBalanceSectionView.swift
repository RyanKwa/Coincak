//
//  TotalBalanceSectionView.swift
//  CoinCak
//
//  Created by mac on 07/03/25.
//

import SwiftUI

struct TotalBalanceSectionView: View {
    @State var isShowBalance: Bool = false
    @EnvironmentObject var coordinator: HomeCoordinator
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text("Total Balance")
                    Image(systemName: "eye")
                        .resizable()
                        .frame(width: 24.0, height: 18.0)
                }
                Spacer()
                CopyableAddressView()
            }.padding(.horizontal, 20.0)
            BalanceInfoView()
            HStack(spacing: 0) {
                Group {
                    BalanceActionButton(icon: "arrow.up", text: "Send") {
                        print("Send")
                        coordinator.push(.send)
                    }
                    BalanceActionButton(icon: "arrow.down", text: "Receive")  {
                        print("Recieve")
                        coordinator.push(.receive)
                    }
                    BalanceActionButton(icon: "arrow.left.arrow.right", text: "Swap")  {
                        print("Swap")
                        coordinator.push(.swap)
                    }
                    BalanceActionButton(icon: "wallet.pass", text: "Buy/Sell")  {
                        print("Buy/Sell")
                        coordinator.push(.buyOrSell)
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
    TotalBalanceSectionView()
}
