//
//  APICaller.swift
//  4th Week Homework2
//
//  Created by Murat Ceyhun Korpeoglu on 26.12.2022.
//

import Foundation


final class APICaller {
    static let shared = APICaller()
    
    private struct Constant {
        static let apiKey = "BFF60773-0DDF-4EE9-855A-F3B8D644DF3F"
        static let assetsEndpoint = "https://rest.coinapi.io/v1/assets/"
    }
    
    private init() {}
    
    public var icons: [ImgIcon] = []
    
    private var dataFailed : ((Result<[Crypto],Error>) -> Void)?
    
    
    
    // MARK: - Public
    
    
    public func getAllCryptoData(
        completion: @escaping (Result<[Crypto], Error>) -> Void
    ) {
        
        guard !icons.isEmpty else {
            dataFailed = completion
            return
        }
        
        guard let url = URL(string: Constant.assetsEndpoint + "?apikey=" + Constant.apiKey) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            
            do {
                
                // Decode response
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                completion(.success(cryptos.sorted { primary, secondary -> Bool in
                    return primary.price_usd ?? 0 > secondary.price_usd ?? 0
                }))
                
            }
            
            
            
            catch {
                completion(.failure(error))
                
            }
        }
        task.resume()
        
    }
    
    
    public func getAllIcons() {
        guard let url = URL(string: "https://rest.coinapi.io/v1/assets/icons/55/?apikey=BFF60773-0DDF-4EE9-855A-F3B8D644DF3F") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            
            do {
                
                self?.icons = try JSONDecoder().decode([ImgIcon].self, from: data)
                if let completion = self?.dataFailed {
                    self?.getAllCryptoData(completion: completion)
                }
            }
            
            catch {
                
                print("ERROR : \(error)")
                
            }
        }
        task.resume()
    }
    
    
    
}
