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
    var leftItem: AnyView?
    var titleView: TitleView
    var rightItem: AnyView?
    
    /// Init with all three items
    init(
        @ViewBuilder leftItem: @escaping () -> LeftItem,
        @ViewBuilder titleView: @escaping () -> TitleView,
        @ViewBuilder rightItem: @escaping () -> RightItem
    ) {
        self.leftItem = AnyView(leftItem())
        self.titleView = titleView()
        self.rightItem = AnyView(rightItem())
    }
    
    /// Init with only left item and title
    init(
        @ViewBuilder leftItem: @escaping () -> LeftItem,
        @ViewBuilder titleView: @escaping () -> TitleView
    ) where RightItem == EmptyView {
        self.leftItem = AnyView(leftItem())
        self.titleView = titleView()
        self.rightItem = nil
    }
    
    
    /// init with only title and right item
    init(
        @ViewBuilder titleView: @escaping () -> TitleView,
        @ViewBuilder rightItem: @escaping () -> RightItem
    ) where LeftItem == EmptyView {
        self.leftItem = nil
        self.titleView = titleView()
        self.rightItem = AnyView(rightItem())
    }
    
    /// Init with only title
    init(
        @ViewBuilder titleView: @escaping () -> TitleView
    ) where LeftItem == EmptyView, RightItem == EmptyView {
        self.leftItem = nil
        self.titleView = titleView()
        self.rightItem = nil
    }
    
    var body: some View {
        VStack {
            HStack {
                if leftItem != nil {
                    self.leftItem
                } else {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .frame(width: 24.0, height: 24.0)
                }
                Spacer()
                titleView
                Spacer()
                if rightItem != nil {
                    self.rightItem
                } else {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 24.0, height: 24.0)
                }
            }
            .padding(.vertical, 12.0)
            .padding(.horizontal, 24.0)
            Divider()
        }
    }
}

#Preview {
    NavigationHeader {
        Text("Title")
    } rightItem: {
        Image(systemName: "ellipsis.circle.fill")
            .resizable()
            .frame(width: 24.0, height: 24.0)
    }

}
