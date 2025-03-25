//
//  NavigationHeader.swift
//  CoinCak
//
//  Created by mac on 18/03/25.
//

import SwiftUI

struct NavigationHeader: View {
    
    let navigationHeaderConfig: NavigationHeaderConfig

    var body: some View {
        VStack {
            HStack {
                navigationHeaderConfig.leftItem
                Spacer()
                navigationHeaderConfig.titleView
                Spacer()
                navigationHeaderConfig.rightItem
            }
            .padding(.vertical, 12.0)
            .padding(.horizontal, 24.0)
            Divider()
        }
    }
}

#Preview {
    NavigationHeader(navigationHeaderConfig: NavigationHeaderConfig(leftItem: {
        Button(action: {
            print("Left")
        }) {
            Image(systemName: "arrow.backward")
                .resizable()
                .frame(width: 24.0, height: 24.0)
        }.buttonStyle(.plain)
    }, titleView: Text("Title"), rightItem: {
        Button(action: {
            print("Left")
        }) {
            Image(systemName: "arrow.forward")
                .resizable()
                .frame(width: 24.0, height: 24.0)
        }.buttonStyle(.plain)
    }, backButtonAction: {
        print("Back")
    }))
}
