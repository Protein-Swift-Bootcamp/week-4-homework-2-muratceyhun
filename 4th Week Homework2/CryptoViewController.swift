//
//  CryptoViewController.swift
//  4th Week Homework2
//
//  Created by Murat Ceyhun Korpeoglu on 25.12.2022.
//

import UIKit

class CryptoViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var array = [
                "MCK",
                "CKL",
                "KLD"
    
    
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
        view.backgroundColor = .yellow
        title = "fafafsfsa"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Back",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(tap))
        
    

    }
    @objc func tap() {
        print("rasfafsafs")
    }
    


}



extension CryptoViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}


extension CryptoViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath)
        
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
}

