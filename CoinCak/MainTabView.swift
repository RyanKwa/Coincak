//
//  MainTabView.swift
//  CoinCak
//
//  Created by mac on 28/02/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
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
        }
    }
}

#Preview {
    MainTabView()
}
