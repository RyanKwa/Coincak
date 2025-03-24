//
//  Coordinator.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 24/03/25.
//

import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype Route: Hashable
    var path: NavigationPath { get set }
    var routes: [Route] { get }
    
    func push(_ route: Route)
    func pop()
    func popToFirst(where condition: (Route) -> Bool)
    func popToRoot()
}
