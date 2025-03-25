//
//  HomeView.swift
//  CoinCak
//
//  Created by mac on 28/02/25.
//

import SwiftUI

struct HomeView: View {
    var titles: [String] = [
        "Tokens",
        "NFTs",
    ]
    
    @State var selectedIndex: Int = 0
    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject var coordinator: HomeCoordinator
    
    var body: some View {
        ScrollView {
            VStack {
                HomeHeader()
                BalanceSectionView()
                    .padding(.top, 24.0)
                Text("Your Token")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.horizontal, 24)
                TokenListView(tokens: viewModel.ownedTokens)
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}

