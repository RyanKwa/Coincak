//
//  HomeView.swift
//  CoinCak
//
//  Created by mac on 28/02/25.
//

import SwiftUI

struct HomeView: View {
    var titles: [String] = [
        "One",
        "Two",
        "Three",
    ]
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                HomeHeader()
                BalanceSectionView()
                    .padding(.top, 24.0)
                SegmentedView(titles,
                              selectedIndex: Binding(get: { selectedIndex },
                                                     set: { selectedIndex = $0 ?? 0 }),
                              selectionAlignment: .center,
                              content: { item, isSelected in
                    Text(item)
                        .foregroundColor(isSelected ? Color.black : Color.gray)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    
                }, selection: {
                    VStack(spacing: 0) {
                        Spacer()
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 3)
                    }
                })
            }
        }.navigationDestination(for: String.self) { value in
            
        }
    }
}

#Preview {
    HomeView()
}


