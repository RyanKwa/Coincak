//
//  TokenListView.swift
//  CoinCak
//
//  Created by mac on 12/03/25.
//

import SwiftUI

struct TokenListView<T: TokenData>: View {
    
    var tokens: [T]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(tokens, id: \.self) { data in
                    TokenCell(data: data)
                        .padding(.horizontal, 20.0)
                        .padding(.vertical, 8.0)
                }
            }
        }
    }
}

#Preview {
    TokenListView(tokens: [PortfolioTokenData(icon: "", name: "Bitcoin", alias: "BTC", currentPrice: "$10.000", gain: "profit", gainPercentage: "+0.1%", tokenOwned: "1.2 Bitcoin")])
}
