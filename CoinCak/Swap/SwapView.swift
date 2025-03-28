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

enum SwapViewInputSection: String {
    case originInputBalance
    case destinationInputBalance
}

struct InputAmountView: View {
    
    @EnvironmentObject var coordinator: HomeCoordinator
    
    @State var currentActiveSection: String = SwapViewInputSection.originInputBalance.rawValue
    
    @StateObject var viewModel = SwapViewModel()
    @FocusState private var focusedField: SwapViewInputSection?
    var body: some View {
        ZStack {
            VStack {
                NavigationHeader(navigationHeaderConfig: setupNavigationHeader())
                Spacer()
            }.zIndex(1)
            VStack {
                TokenBalanceSection(text: $viewModel.inputtedBalanceOrigin)
                    .focused($focusedField, equals: .originInputBalance)
                
                TokenBalanceSection(hideBottomSection: true, text: $viewModel.inputtedBalanceDestination)
                    .focused($focusedField, equals: .destinationInputBalance)
                
                Divider()
                    .padding(.top, 10.0)
                
                NumberPadInput(keyTapped: handleNumpadInput)
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
                .onAppear {
                    focusedField = .originInputBalance
                }
        }
    }
    
    private func handleNumpadInput(_ key: String) {
        guard let field = focusedField else { return }
        DispatchQueue.main.async {
            viewModel.handleNumpadInput(key, for: field)
        }
    }
    
    private func setupNavigationHeader() -> NavigationHeaderConfig {
        return NavigationHeaderConfig(titleView: Text("Swap")) {
            coordinator.pop()
        }
    }
}

struct NumberPadInput: View {
    var keyTapped: ((String) -> Void)
    var inputNumber: [String] = [
        "1", "2", "3",
        "4", "5", "6",
        "7", "8", "9",
        ",", "0", "delete",
    ]
    
    let columns = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 20.0) {
                ForEach(inputNumber, id:\.self) { text in
                    Button {
                        keyTapped(text)
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
            .onAppear {
//                tabBarHelper.setTabBar(hidden: true)
            }
            .onDisappear {
//                tabBarHelper.setTabBar(hidden: false)
            }
            .padding(.horizontal, 28.0)
        }
    }
}

#Preview {
    SwapView()
}
