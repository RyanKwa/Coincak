//
//  SwapView.swift
//  CoinCak
//
//  Created by mac on 19/03/25.
//

import SwiftUI

struct SwapView: View {
    var body: some View {
        VStack {
            InputAmountView()
        }
    }
}

struct InputAmountView: View {
    @EnvironmentObject var coordinator: HomeCoordinator
    @State var inputtedValue: String = ""
    var body: some View {
        ZStack {
            VStack {
                NavigationHeader(navigationHeaderConfig: setupNavigationHeader())
                Spacer()
            }.zIndex(1)
            VStack {
                TokenBalanceSection()
                TokenBalanceSection(hideBottomSection: true)
                Divider()
                    .padding(.top, 10.0)
                NumberPadInput(inputtedNumber: $inputtedValue)
                    .padding(.vertical, 10)
                Button {
                    
                } label: {
                    Text("Swap Now")
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding(.horizontal, 20.0)
            }.padding(.top, 70.0)
        }
    }
    
    func setupNavigationHeader() -> NavigationHeaderConfig {
        return NavigationHeaderConfig(titleView: Text("Swap")) {
            coordinator.pop()
        }
    }
}

struct NumberPadInput: View {
    @Binding var inputtedNumber: String
    var inputNumber: [String] = [
        "1", "2", "3",
        "4", "5", "6",
        "7", "8", "9",
        "000", "0", "delete",
    ]
    
    let columns = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 20.0) {
                ForEach(inputNumber, id:\.self) { text in
                    Button {
                        print("tapped \(text)")
                        if text == "delete" {
                            inputtedNumber.removeLast()
                        } else {
                            inputtedNumber += text
                        }
                    } label: {
                        if text == "delete" {
                            Image(systemName: "arrow.backward")
                                .resizable()
                                .frame(width: 24.0, height: 24.0)
                        } else {
                            Text(text)
                                .font(.system(size: 28.0, weight: .medium))
                                .padding()
                        }
                    }.foregroundStyle(Color.black)
                }
            }
            .padding(.horizontal, 28.0)
        }
    }
}

#Preview {
    SwapView()
}
