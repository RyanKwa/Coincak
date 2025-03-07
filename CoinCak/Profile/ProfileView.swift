//
//  ProfileView.swift
//  CoinCak
//
//  Created by mac on 28/02/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile View")
            NavigationLink("Go to Profile Detail A", value: "Profile Detail A")
            NavigationLink("Go to Profile Detail B", value: "Profile Detail B")
        }
    }
}

#Preview {
    ProfileView()
}
