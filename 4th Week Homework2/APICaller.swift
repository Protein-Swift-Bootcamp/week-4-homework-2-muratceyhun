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
    
//    public var icons: [ImgIcon] = []
    
    
    
    // MARK: - Public
    
    
    public func getAllCryptoData(
        completion: @escaping (Result<[Crypto], Error>) -> Void
    ) {
        
//        guard !icons.isEmpty else {
//            return
//        }
        
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
                
                completion(.success(cryptos))
                
            }
            
            
            
            catch {
                completion(.failure(error))
                
            }
        }
        task.resume()
        
    }
    
    
//    public func getAllIcons() {
//        guard let url = URL(string: "https://rest.coinapi.io/v1/assets/icons/55/?apikey=BFF60773-0DDF-4EE9-855A-F3B8D644DF3F") else {
//            return
//        }
//        
//        
//        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            
//            
//            do {
//                
//                self?.icons = try JSONDecoder().decode([ImgIcon].self, from: data)
//                
//                
//            }
//            
//            
//            
//            catch {
//                
//                print("ERROR : \(error)")
//                
//            }
//        }
//        task.resume()
//    }
    
    
    
}
