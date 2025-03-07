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
            
            HStack {
                BalanceInfoView()
            }
        }
    }
}

#Preview {
    BalanceSectionView()
}

struct BalanceInfoView: View {
    var body: some View {
        HStack {
            Text("$90.000,00")
                .font(.system(size: 40, weight: .bold))
                .padding(.leading, 20.0)
            Spacer()
            VStack {
                Text("$90.000,00")
                Text("$90.000,00")
            }.padding(.trailing, 20.0)
        }
    }
}

struct BalanceGainView {
    
}

struct CopyableAddressView: View {
    var body: some View {
        HStack {
            Text("0x742d35Cc6634C0532925a3b844Bc454e4438f44e".replacingRange(indexFromStart: 5, indexFromEnd: 4, replacing: "...."))
            Image(systemName: "square.on.square")
        }
    }
}

struct TotalBalanceView: View {
    var body: some View {
        HStack {
            Text("Total Balance")
            Image(systemName: "eye")
                .resizable()
                .frame(width: 24.0, height: 18.0)
        }
    }
}
