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
    
    var body: some View {
        NavigationStack {
            ScrollView {
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
                            .foregroundColor(isSelected ? Color.blue : Color.gray)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        
                    }, selection: {
                        VStack(spacing: 0) {
                            Spacer()
                            Rectangle()
                                .fill(Color.blue)
                                .frame(height: 3)
                        }
                    }).padding(.horizontal, 20.0)
                        .padding(.bottom, 16.0)
                    ZStack {
                        switch selectedIndex {
                        case 0:
                            TokenListView()
                        case 1:
                            Rectangle()
                                .fill(Color.blue)
                        default:
                            EmptyView()
                        }
                    }
                        
                    Spacer()
                }
            }

        }.navigationDestination(for: String.self) { value in
            
        }
    }
}

#Preview {
    HomeView()
}

