//
//  HomeView.swift
//  CoinCak
//
//  Created by mac on 28/02/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HomeHeader()
                Text("Home")
                NavigationLink("Go to Home Detail A", value: "Home Detail A")
                NavigationLink("Go to Home Detail B", value: "Home Detail B")
            }
        }.navigationDestination(for: String.self) { value in
            
        }
    }
}

#Preview {
    HomeView()
}
