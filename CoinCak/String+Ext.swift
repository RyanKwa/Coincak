//
//  String+Ext.swift
//  CoinCak
//
//  Created by mac on 07/03/25.
//

import Foundation

extension String {
    
    func replacingRange(indexFromStart: Int, indexFromEnd: Int, replacing: String = "") -> Self {
        return String(self.prefix(indexFromStart)) + replacing + String(self.suffix(indexFromEnd))
    }
}
