//
//  Models.swift
//  4th Week Homework2
//
//  Created by Murat Ceyhun Korpeoglu on 26.12.2022.
//

import Foundation

struct Crypto: Codable {
        
    let asset_id: String
    let name: String
    let price_usd: Float?
    let id_icon: String?
}



struct ImgIcon: Codable {
    let asset_id: String
    let url : String
}





