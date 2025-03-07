//
//  PortfolioView.swift
//  CoinCak
//
//  Created by mac on 28/02/25.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        VStack {
            Text("Portfolio View")
            NavigationLink("Go to Portfolio Detail A", value: "Portfolio Detail A")
            NavigationLink("Go to Portfolio Detail B", value: "Portfolio Detail B")
        }
    }
}

#Preview {
    PortfolioView()
}
