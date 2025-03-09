//
//  TotalBalanceView.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 08/03/25.
//

import SwiftUI

struct TotalBalanceView: View {
    var body: some View {
        HStack {
            Text("Total Balance")
            Image(systemName: "eye")
                .resizable()
                .frame(width: 24.0, height: 18.0)
        }
    }
}

#Preview {
    TotalBalanceView()
}
