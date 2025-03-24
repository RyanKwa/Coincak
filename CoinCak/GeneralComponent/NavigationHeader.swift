//
//  NavigationHeader.swift
//  CoinCak
//
//  Created by mac on 18/03/25.
//

import SwiftUI

struct NavigationHeader<LeftItem: View,
                        TitleView: View,
                        RightItem: View> : View {
    var leftItem: LeftItem?
    var titleView: TitleView
    var rightItem: RightItem?
    init(@ViewBuilder leftItem: () -> LeftItem = { EmptyView() },
         titleView: TitleView,
         @ViewBuilder rightItem: () -> RightItem = { EmptyView() }) {
        self.leftItem = leftItem()
        self.titleView = titleView
        self.rightItem = rightItem()
    }

    var body: some View {
        VStack {
            HStack {
                if LeftItem.self == EmptyView.self {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .frame(width: 24.0, height: 24.0)
                } else {
                    leftItem
                }
                Spacer()
                titleView
                Spacer()
                if RightItem.self == EmptyView.self {
                    Rectangle()
                    .fill(Color.clear)
                        .frame(width: 24.0, height: 24.0)
                } else {
                    self.rightItem
                }
            }
            .padding(.vertical, 12.0)
            .padding(.horizontal, 24.0)
            Divider()
        }
    }
}

#Preview {
    NavigationHeader(titleView: Text("Title"))
}
