//
//  Double+Extensions.swift
//  FinancialApp
//
//  Created by Chukwuemeka Jennifer on 29/12/2021.
//

import Foundation

extension Double {
    var stringValue: String {
        return String(describing: self)
    }
    
    var twoDecimalPlaceString: String {
        return String(format: "%.2f",self)
    }
    
    
    var currencyFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle =  .currency
        if let value = formatter.string(from: self as NSNumber) {
            return value
        }
        return twoDecimalPlaceString
    }
    
    var percentageFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle =  .percent
        formatter.maximumFractionDigits = 2
        if let value = formatter.string(from: self as NSNumber) {
            return value
        }
        return twoDecimalPlaceString
        
    }
    
    
    func toCurrencyFormat(hasDollarSymbol: Bool = true, hasDecimalPlaces: Bool = true) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle =  .currency
        if hasDollarSymbol == false {
            formatter.currencySymbol = ""
    }
        if hasDecimalPlaces == false {
            formatter.maximumFractionDigits = 0
        }
        return formatter.string(from: self as NSNumber) ?? twoDecimalPlaceString
}
}
