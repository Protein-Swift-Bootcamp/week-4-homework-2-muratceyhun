//
//  MainViewController.swift
//  4th Week Homework2
//
//  Created by Murat Ceyhun Korpeoglu on 25.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageVİew: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Welcome to Trade World"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemIndigo
        

    }
    
    
    @IBAction func cryptoButtonClicked(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "cryptoVC") as! CryptoViewController
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.modalTransitionStyle = .flipHorizontal
        self.present(destinationVC, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func currencyButtonClicked(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "currencyVC") as! CurrencyViewController
        destinationVC.modalTransitionStyle = .flipHorizontal
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
        
        
        
        
        
    }
    


}

