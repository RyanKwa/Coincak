//
//  ReceiveView.swift
//  CoinCak
//
//  Created by mac on 17/03/25.
//

import SwiftUI

struct ReceiveView: View {
    
    var body: some View {
        VStack() {
            
            NavigationHeader(titleView: Text("Receive"))
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 232, height: 232)
                    Image("QRPlaceholder")
                        .resizable()
                        .frame(width: 200.0, height: 200.0)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding(.bottom, 18.0)
                
                HStack {
                    Text("0x1822891819sk19382wrws28272")
                        .font(.system(size: 14.0))
                        .padding(.trailing, 4.0)
                    
                    Button {
                        print("Copy")
                    } label:  {
                        Image(systemName: "square.on.square")
                            .resizable()
                            .frame(width: 18, height: 18)
                    }.buttonStyle(.plain)
                }
                .padding(16.0)
                .background(GeometryReader { geometry in
                    Color.gray.frame(width: geometry.size.width, height: geometry.size.height).opacity(0.1)
                })
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                
            }.padding(.top, 0)
            Spacer()
        }
    }
}

#Preview {
    ReceiveView()
}
