//
//  ConverterViewController.swift
//  HomeWork3
//
//  Created by user on 11/13/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    var stillTyping = false
    var dotIsPlaced = false
    
    @IBOutlet weak var resultLabel: UILabel!
    
  @IBOutlet weak var quote1ImageView: UIImageView!
  
  @IBOutlet weak var quote2ImageView: UIImageView!
  
  @IBOutlet weak var quote1NameLabel: UILabel!
  
  @IBOutlet weak var quote2NameLabel: UILabel!
  
  var quote1: Quote? {
    didSet {
      quote1ImageView.image = quote1?.iconImage
      quote1NameLabel.text = quote1?.symbol
    }
  }
  
  var quote2: Quote? {
    didSet {
      quote2ImageView.image = quote2?.iconImage
      quote2NameLabel.text = quote2?.symbol
    }
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    let quotes = QuoteProvider().generateQuotes()
    quote1 = quotes[0]
    quote2 = quotes[2]
    convert()
    
      NotificationCenter.default.addObserver(self, selector: #selector(updateQuotes(notification:)), name: NSNotification.Name("selectQuote"), object: nil)
  }
  
  @objc func updateQuotes(notification: Notification){
      if let (newQuote, id) = notification.object as? (Quote, Int) {
        switch id {
        case 1:
          quote1 = newQuote
        case 2:
          quote2 = newQuote
        default:
          break
        }
      }
    convert()
  }
  
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        if stillTyping {
            displayLabel.text = displayLabel.text! + number
        } else {
            displayLabel.text = number
            stillTyping = true
        }
      convert()
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        displayLabel.text = "0"
        stillTyping = false
        dotIsPlaced = false
      convert()
    }
    
    @IBAction func dotButton(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            displayLabel.text = displayLabel.text! + "."
            dotIsPlaced = true
        }else if !stillTyping && !dotIsPlaced {
            displayLabel.text = "0."
        }
      convert()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quoteController = segue.destination as? QuotesTableViewController
        quoteController?.isSelectQuote = true
      if let button = sender as? UIButton {
        quoteController?.senderId = button.tag
      }
    }
  
  private func convert() {
    guard let quote1 = quote1,
      let quote2 = quote2 else {
        return
    }
    let converter = Converter(baseQuote: quote1)
    let stringNum = displayLabel.text ?? ""
    let numberOfQuotes = Double(stringNum) ?? 0.0
    let convertedValue = converter.convert(numberOfQuotes: numberOfQuotes, convertQuote: quote2)
    resultLabel.text = "\(convertedValue)"
  }
  
}
