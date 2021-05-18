//
//  QuotesTableViewController.swift
//  HomeWork3
//
//  Created by Karina Karimova on 11/3/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController {
  
  var isSelectQuote = false
  var senderId = 0
  
  let quoteProvider = QuoteProvider()
  var quotes: [Quote] = []
    var newQuotes: [Quote] = []
    var timer = Timer()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    quotes = QuoteProvider.quotes
   
    NotificationCenter.default.addObserver(self, selector: #selector(updateQuotes(notification:)), name: NSNotification.Name("quotes"), object: nil)
  }
    @objc func updateQuotes(notification: Notification){
        if let newQuotes = notification.object as? [Quote] {
            quotes = newQuotes
            tableView.reloadData()
        }
    }
    // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 88
  }
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCellIdentifier", for: indexPath) as! QuoteCell
      let quote = quotes[indexPath.row]
      cell.rankLabel.text = "\(quote.rank)"
      cell.nameLabel.text = quote.name
      cell.symbolLabel.text = quote.symbol
      cell.priceUsdLabel.text = String(format: "%.2f $", quote.price_usd)
      cell.quoteIconImageView.image = quote.iconImage
        return cell
    }
  
  //MARK: - TableView delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if isSelectQuote {
      NotificationCenter.default.post(name: NSNotification.Name("selectQuote"), object: (quotes[indexPath.row], senderId))
      dismiss(animated: true, completion: nil)
      return
    }
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    if let vc = storyBoard.instantiateViewController(withIdentifier: "QuoteDetailViewController") as? QuoteDetailViewController {
      vc.quote = quotes[indexPath.row]
      navigationController?.pushViewController(vc, animated: true)
    }
    
  }
  
}
