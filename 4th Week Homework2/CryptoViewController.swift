//
//  CryptoViewController.swift
//  4th Week Homework2
//
//  Created by Murat Ceyhun Korpeoglu on 25.12.2022.
//

import UIKit

class CryptoViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true

            title = "Crypto"
        activityIndicator.startAnimating()
        tableView.delegate = self
        tableView.dataSource = self
        
        APICaller.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({ model in
                    
                    // NumberFormatter
                    let price = model.price_usd ?? 0
                    let formatter = CryptoViewController.numberFormatter
                    let priceString = formatter.string(from: NSNumber(value: price))
                    
                    let iconUrl = URL(string: APICaller.shared.icons.filter ({ icon in
                        icon.asset_id == model.asset_id
                    }).first?.url ?? "")
                    
                 return CryptoTableViewCellViewModel(
                 name: model.name ?? "N/A",
                 symbol: model.asset_id,
                 price: priceString ?? "N/A",
                 iconUrl: iconUrl
                    )
                }).filter {$0.iconUrl != nil}
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self!.activityIndicator.stopAnimating()

                }
            case .failure(let error):
                print("ERROR : \(error)")
            }
        }
  
    }
}

//MARK: -UITableViewDelegate

extension CryptoViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

//MARK: -UITableViewDataSource

extension CryptoViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptoTableViewCell
        
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

