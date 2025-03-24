//
//  HomeCoordinator.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 24/03/25.
//

import SwiftUI

enum HomeRoute: Hashable {
    case tokenDetail(tokenId: String)
    case send
    case receive
    case swap
    case buyOrSell
}

class HomeCoordinator: BaseCoordinator<HomeRoute> {
    
    @ViewBuilder
    func build(_ route: HomeRoute) -> some View {
        Group {
            switch route {
            case .tokenDetail(let tokenId):
                Text("Token Detail")
            case .send:
                Text("Send")
            case .receive:
                ReceiveView()
            case .swap:
                Text("Swap")
            case .buyOrSell:
                Text("Buy or Sell")
            }
        }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
}
