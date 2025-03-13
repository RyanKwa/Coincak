//
//  TokenListView.swift
//  CoinCak
//
//  Created by mac on 12/03/25.
//

import SwiftUI

struct TokenListView: View {
    @State var isProfit: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<10) { _ in
                    TokenCell(isProfit: $isProfit)
                        .padding(.horizontal, 20.0)
                        .padding(.vertical, 8.0)
                }
            }
        }
    }
}

struct TokenCell: View {
    
    @Binding var isProfit: Bool
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 60, height: 60)
                Image(systemName: "diamond.circle.fill")
            }
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text("BTC")
                    .font(.system(size: 14.0, weight: .medium))
                Text("1.2 Bitcoin")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 12.0))
            }.padding(.vertical, 8)
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4.0) {
                Text("$62,000.00")
                    .font(.system(size: 14.0, weight: .medium))
                Text("+0.5%")
                    .foregroundStyle(isProfit ? Color.green : Color.red)
                    .font(.system(size: 12.0))
            }.padding(.vertical, 8)
            
        }.frame(maxWidth: .infinity)
    }
}
#Preview {
    TokenListView()
}
