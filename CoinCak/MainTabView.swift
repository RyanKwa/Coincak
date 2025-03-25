//
//  MainTabView.swift
//  CoinCak
//
//  Created by mac on 28/02/25.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var homeCoordinator = HomeCoordinator()
    var body: some View {
        TabView {
            Group {
                HomeCoordinatorView(coordinator: homeCoordinator)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                PortfolioView()
                    .tabItem {
                        Label("Portfolio", systemImage: "chart.pie")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }.toolbarBackground(.white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
        }
    }
}

#Preview {
    MainTabView()
}
