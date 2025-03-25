//
//  HomeCoordinatorView.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 24/03/25.
//

import SwiftUI

struct HomeCoordinatorView: View {
    @ObservedObject var coordinator: HomeCoordinator
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView().navigationDestination(for: HomeRoute.self) { route in
                coordinator.build(route)
            }
        }.environmentObject(coordinator)
    }
}

#Preview {
    HomeCoordinatorView(coordinator: HomeCoordinator())
}
