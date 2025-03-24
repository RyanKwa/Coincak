//
//  BaseCoordinator.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 24/03/25.
//

import SwiftUI

class BaseCoordinator<Route: Hashable>: Coordinator {
    
    @Published var path: NavigationPath = NavigationPath()
    @Published private(set) var routes: [Route] = []
    
    func push(_ route: Route) {
        path.append(route)
        routes.append(route)
    }
    
    func pop() {
        guard !routes.isEmpty else {
            return
        }
        path.removeLast()
        routes.removeLast()
    }
    
    func popToFirst(where condition: (Route) -> Bool) {
        guard let index = routes.firstIndex(where: condition) else { return }

        let countToRemove = routes.count - index - 1
        guard countToRemove > 0 else { return }

        for _ in 0..<countToRemove {
            path.removeLast()
            routes.removeLast()
        }
    }
    
    func popToRoot() {
        path.removeLast(path.count)
        routes.removeAll()
    }
    
    @ViewBuilder
    func build(_ route: Route) -> some View {
        EmptyView()
    }
}

