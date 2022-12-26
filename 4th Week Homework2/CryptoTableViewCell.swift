//
//  CryptoTableViewCell.swift
//  4th Week Homework2
//
//  Created by Murat Ceyhun Korpeoglu on 26.12.2022.
//

import UIKit

struct CryptoTableViewCellViewModel {
    let name: String
    let symbol: String
    let price: String
}



class CryptoTableViewCell: UITableViewCell {

     
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    
    
    
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
    
    
    }
}
