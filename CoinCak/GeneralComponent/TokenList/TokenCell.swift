//
//  TokenCell.swift
//  CoinCak
//
//  Created by mac on 14/03/25.
//

import SwiftUI

struct TokenCell<T: TokenData>: View {
    
    @ObservedObject var data: T
    
    var gainColor: Color {
        if let gainType = GainType(rawValue: data.gain) {
            switch gainType {
            case .profit: return .green
            case .loss: return .red
            case .neutral: return .black
            }
        }
        return .black
    }
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 60, height: 60)
                Image(systemName: "diamond.circle.fill")
            }
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(data.name)
                    .font(.system(size: 14.0, weight: .medium))
                Group {
                    if let portfolioData = data as? PortfolioTokenData {
                        Text(portfolioData.tokenOwned)
                    } else if data is SearchableTokenData {
                        Text(data.name)
                    }
                }.foregroundStyle(Color.gray)
                    .font(.system(size: 12.0))
            }.padding(.vertical, 8)
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4.0) {
                Text(data.currentPrice)
                    .font(.system(size: 14.0, weight: .medium))
                
                Text("+0.5%")
                    .foregroundStyle(gainColor)
                    .font(.system(size: 12.0))
            }.padding(.vertical, 8)
            
        }.frame(maxWidth: .infinity)
    }
}

#Preview {
    TokenCell(data: PortfolioTokenData(icon: "", name: "Bitcoin", alias: "BTC", currentPrice: "$50.000", gain: "1", gainPercentage: "+0.1%", tokenOwned: "1.2 Bitcoin"))
}
