//
//  BalanceInfoView.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 08/03/25.
//

import SwiftUI

struct BalanceInfoView: View {
    var body: some View {
        HStack {
            Text("$90.000,00")
                .font(.system(size: 40, weight: .bold))
                .padding(.leading, 20.0)
            Spacer()
            VStack(alignment: .trailing){
                Text("+ $200")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 12.0))
                    .padding(8.0)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                Text("+ 0.5%")
                    .foregroundStyle(Color.green)
                    .font(.system(size: 12.0, weight: .bold))
            }.padding(.trailing, 20.0)
        }
    }
}

#Preview {
    BalanceInfoView()
}
