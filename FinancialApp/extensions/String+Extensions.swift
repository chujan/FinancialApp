//
//  String+Extensions.swift
//  FinancialApp
//
//  Created by Chukwuemeka Jennifer on 27/12/2021.
//

import Foundation

extension String {
    func addBrackets() -> String {
        return "(\(self))"
    }
    func prefix(withText text: String) -> String {
        return text + self
    }
    func toDouble() -> Double? {
        return Double (self)
    }
}
