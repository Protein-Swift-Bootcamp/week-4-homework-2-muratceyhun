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


//
//struct ImgIcon: Codable {
//    let asset_id: String
//    let url : String
//}





//
//"asset_id": "BTC",
//"name": "Bitcoin",
//"type_is_crypto": 1,
//"data_quote_start": "2014-02-24T17:43:05.0000000Z",
//"data_quote_end": "2022-12-26T00:00:00.0000000Z",
//"data_orderbook_start": "2014-02-24T17:43:05.0000000Z",
//"data_orderbook_end": "2022-12-26T00:00:00.0000000Z",
//"data_trade_start": "2010-07-17T23:09:17.0000000Z",
//"data_trade_end": "2022-12-26T00:00:00.0000000Z",
//"data_symbols_count": 125259,
//"volume_1hrs_usd": 3749288868923214.43,
//"volume_1day_usd": 74116510837623399.98,
//"volume_1mth_usd": 2136633511057660649.78,
//"price_usd": 16826.540113054287243366388384,
//"id_icon": "4caf2b16-a017-4e26-a348-2cea69c34cba",
//"data_start": "2010-07-17",
//"data_end": "2022-12-26"
