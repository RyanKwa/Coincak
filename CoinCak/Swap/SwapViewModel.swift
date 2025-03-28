//
//  SwapViewModel.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 28/03/25.
//

import SwiftUI

class SwapViewModel: ObservableObject {
    
    @Published var inputtedBalanceOrigin: String = ""
    @Published var inputtedBalanceDestination: String = ""
    
    func handleNumpadInput(_ key: String, for section: SwapViewInputSection) {
        
        switch section {
        case .originInputBalance:
            updateInput(&inputtedBalanceOrigin, key: key)
        case .destinationInputBalance:
            updateInput(&inputtedBalanceDestination, key: key)
        }
    }
    
    private func updateInput(_ input: inout String, key: String) {
        if key == "delete" {
            if !input.isEmpty {
                input.removeLast()
            }
        } else {
            input += key
        }
    }
}
