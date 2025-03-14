//
//  HomeViewModel.swift
//  CoinCak
//
//  Created by mac on 28/02/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var tokens: [PortfolioTokenData] = []
    
    init() {
        fetchTokens()
        fetchUpdatingTokens()
    }
    
    func fetchTokens() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tokens = [
                PortfolioTokenData(icon: "", name: "Bitcoin", alias: "BTC", currentPrice: "$10.000", gain: "profit", gainPercentage: "+0.1%", tokenOwned: "1.2 BTC"),
                PortfolioTokenData(icon: "", name: "Ethereum", alias: "ETH", currentPrice: "$2.000", gain: "loss", gainPercentage: "-0.5%", tokenOwned: "5.0 ETH")
            ]
        }
    }
    
    func fetchUpdatingTokens() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            DispatchQueue.main.async {
                for token in self.tokens {
                    let newPrice = Int.random(in: 9000...11000)
                    token.currentPrice = "$\(newPrice)"
                    
                    token.gain = newPrice > 10000 ? "profit" : "loss"
                    token.gainPercentage = newPrice > 10000 ? "+0.4%" : "-0.10%"
                }
            }
        }
    }
    
}
