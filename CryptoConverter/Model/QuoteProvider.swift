//
//  QuoteProvider.swift
//  HomeWork3
//
//  Created by Karina Karimovaа on 11/3/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import UIKit

class QuoteProvider {
    
    static var quotes: [Quote] = []
    
    func createTimer(){
        Timer.scheduledTimer(withTimeInterval: 300 , repeats: true)
        { timer in
            QuoteProvider.quotes = self.generateQuotes()
            NotificationCenter.default.post(name: NSNotification.Name("quotes"), object: QuoteProvider.quotes)
        }
    }
  
func generateQuotes () -> [Quote] {
  
  let id = ["bitcoin", "ethereum", "litecoin", "binance-coin", "stellar", "monero"]
  let symbols = ["BTC", "ETH", "LTC", "BNB", "XLM", "XMR"]
  let names = ["Bitcoin", "Ethereum", "Litecoin", "Binance Coin", "Stellar", "Monero"]
  
  var arrQuote: [Quote]  = []
  for i in 0...5 {
    let newQuote = Quote(id: id[i],
                         name: names[i],
                         symbol: symbols[i],
                         rank: i+1,
                         price_usd: Double.random(in: 0...10000),
                         price_btc: Double.random(in: 0...10),
                         _24h_volume_usd: Double.random(in: 0...10000),
                         market_cap_usd: Double.random(in: 0...100000),
                         available_supply: Double.random(in: 1e6...1e8),
                         total_supply: Double.random(in: 1e6...1e8),
                         max_supply: Double.random(in: 1e6...1e8),
                         percent_change_1h: Double.random(in: -1...1),
                         percent_change_24h: Double.random(in: -10...10),
                         percent_change_7d: Double.random(in: -10...10),
                         last_updated: Int.random(in: 1...100),
                         iconImage: UIImage(named: id[i]) ?? UIImage())
    arrQuote.append(newQuote)
  }
  return arrQuote
}
}
  
