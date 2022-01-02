//
//  Date+Extensions.swift
//  FinancialApp
//
//  Created by Chukwuemeka Jennifer on 28/12/2021.
//

import Foundation

extension Date {
    
    var MMYYFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}
