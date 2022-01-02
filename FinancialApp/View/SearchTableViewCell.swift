//
//  SearchTableViewCell.swift
//  FinancialApp
//
//  Created by Chukwuemeka Jennifer on 23/12/2021.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var assetNameLabel: UILabel!
    @IBOutlet weak var assetSymbolLabel: UILabel!
    @IBOutlet weak var assetTypeLabel: UILabel!
    
    func configure(with searchResult: SearchResult) {
        assetNameLabel.text = searchResult.name
        assetTypeLabel.text = searchResult.type.appending(" ").appending(searchResult.currency)
        assetSymbolLabel.text = searchResult.symbol
    }
    
    
}
