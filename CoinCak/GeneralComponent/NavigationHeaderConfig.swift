//
//  NavigationHeaderConfig.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 24/03/25.
//

import SwiftUI

struct NavigationHeaderConfig {
    var leftItem: AnyView?
    var titleView: AnyView
    var rightItem: AnyView?
    var backButtonAction: (() -> Void)?
    
    init<LeftItem: View, TitleView: View, RightItem: View>(@ViewBuilder leftItem: () -> LeftItem = { EmptyView() },
                                                           titleView: TitleView,
                                                           @ViewBuilder rightItem: () -> RightItem = { EmptyView() },
                                                           backButtonAction: (() -> Void)?) {

        self.titleView = AnyView(titleView)
        self.backButtonAction = backButtonAction
        if LeftItem.self == EmptyView.self {
            self.leftItem = AnyView(setDefaultBackButton())
        } else {
            self.leftItem = AnyView(leftItem())
        }
        if RightItem.self == EmptyView.self {
            self.rightItem = AnyView(setPlaceholder())
        } else {
            self.rightItem = AnyView(rightItem())
        }
    }
    
    @ViewBuilder
    func setDefaultBackButton() -> some View {
        Button {
            backButtonAction?()
        } label: {
            Image(systemName: "arrow.backward")
                .resizable()
                .frame(width: 24.0, height: 24.0)
        }
        .foregroundStyle(Color.black)
        .buttonStyle(.plain)
    }
    
    @ViewBuilder
    func setPlaceholder() -> some View{
        Rectangle()
        .fill(Color.clear)
            .frame(width: 24.0, height: 24.0)
    }
}
