//
//  CryptoTableViewCell.swift
//  4th Week Homework2
//
//  Created by Murat Ceyhun Korpeoglu on 26.12.2022.
//

import UIKit

class CryptoTableViewCellViewModel {
    let name: String
    let symbol: String
    let price: String
    let iconUrl: URL?
    var iconData: Data?
    
    
    init(name: String,symbol: String,price: String,iconUrl: URL?) {
        self.name = name
        self.symbol = symbol
        self.price = price
        self.iconUrl = iconUrl
        
    }
}



class CryptoTableViewCell: UITableViewCell {

     
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imgIcon.image = nil
        nameLabel.text = nil
        symbolLabel.text = nil
        priceLabel.text = nil
        
    }
    
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        
        if let data = viewModel.iconData {
            
            imgIcon.image = UIImage(data: data)
            
        } else {
            if let url = viewModel.iconUrl {
                let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                    if let data = data {
                        
                        viewModel.iconData = data
                        DispatchQueue.main.async {
                            self?.imgIcon.image = UIImage(data: data)
                        }
                    }
                }
                task.resume()
            }
        }
    
    
    }
}
