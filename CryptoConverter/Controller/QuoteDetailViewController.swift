//
//  QuoteDetailViewController.swift
//  HomeWork3
//
//  Created by Karina Karimova on 11/3/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import UIKit

class QuoteDetailViewController: UIViewController {
  
  @IBOutlet weak var iconImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var symbolLabel: UILabel!
  
  
  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var rankLabel: UILabel!
  @IBOutlet weak var updateLabel: UILabel!
  @IBOutlet weak var priceUsdLabel: UILabel!
  @IBOutlet weak var priceBtcLabel: UILabel!
  @IBOutlet weak var volumeLabel: UILabel!
  @IBOutlet weak var marketLabel: UILabel!
  @IBOutlet weak var availableLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var maxLabel: UILabel!
  @IBOutlet weak var h1Label: UILabel!
  @IBOutlet weak var h24Label: UILabel!
  @IBOutlet weak var d7Label: UILabel!
  
  var quote: Quote?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let quote = quote{
      navigationItem.title = "\(quote.name)"

      iconImageView.image = quote.iconImage
      nameLabel.text = quote.name
      symbolLabel.text = quote.symbol
      
      idLabel.text = "ID:  \(quote.id)"
      rankLabel.text = "Rank:  \(quote.rank)"
      priceUsdLabel.text = String(format: "Price(USD):  %.2f $", quote.price_usd)
      priceBtcLabel.text = String(format: "Price(BTC):  %.2f $", quote.price_btc)
      volumeLabel.text = String(format: "Volume 24h (USD):  %.2f $", quote._24h_volume_usd)
      marketLabel.text = String(format: "Market Cap (USD):  %.2f $", quote.market_cap_usd)
      availableLabel.text = String(format: "Available:  %.2f", quote.available_supply)
      totalLabel.text = String(format: "Total:  %.2f", quote.total_supply)
      maxLabel.text = String(format: "Maximum:  %.2f", quote.max_supply)
      h1Label.text = String(format: "1h:  %.2f %", quote.percent_change_1h)
      h24Label.text = String(format: "24h:  %.2f %", quote.percent_change_24h)
      d7Label.text = String(format: "7d:  %.2f %", quote.percent_change_7d)

      let date = Date(timeIntervalSince1970: TimeInterval(quote.last_updated))
      let formatter = DateFormatter()
      formatter.dateFormat = "dd-MMM-yyyy, hh:mm:ss"
      let dateStr = formatter.string(from: date)
      updateLabel.text = "Last updated:  \(dateStr)"
    }
  }
}
