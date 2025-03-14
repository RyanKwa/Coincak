//
//  HomeEntity.swift
//  CoinCak
//
//  Created by mac on 14/03/25.
//

import Foundation

protocol TokenData: ObservableObject, Hashable, Identifiable {
    var id: UUID { get }
    var icon: String { get }
    var name: String { get }
    var alias: String { get }
    var currentPrice: String { get set}
    var gainPercentage: String { get set}
    var gain: String { get set}
}

class SearchableTokenData: TokenData {
    let id = UUID()
    let icon: String
    let name: String
    let alias: String
    
    @Published var currentPrice: String
    @Published var gain: String
    @Published var gainPercentage: String
    
    init(icon: String, name: String, alias: String, currentPrice: String, gain: String, gainPercentage: String) {
        self.icon = icon
        self.name = name
        self.alias = alias
        self.currentPrice = currentPrice
        self.gain = gain
        self.gainPercentage = gainPercentage
    }
    
    static func == (lhs: SearchableTokenData, rhs: SearchableTokenData) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class PortfolioTokenData: TokenData {
    let id = UUID()
    let icon: String
    let name: String
    let alias: String

    @Published var currentPrice: String
    @Published var gain: String
    @Published var gainPercentage: String

    let tokenOwned: String

    init(icon: String, name: String, alias: String, currentPrice: String, gain: String, gainPercentage: String, tokenOwned: String) {
        self.icon = icon
        self.name = name
        self.alias = alias
        self.currentPrice = currentPrice
        self.gain = gain
        self.gainPercentage = gainPercentage
        self.tokenOwned = tokenOwned
    }

    static func == (lhs: PortfolioTokenData, rhs: PortfolioTokenData) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum GainType: String {
    case profit = "profit"
    case loss = "loss"
    case neutral = "neutral"
}
