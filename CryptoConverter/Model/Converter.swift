//
//  Converter.swift
//  HomeWork3
//
//  Created by Karina Karimova on 11/4/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

class Converter {
  var baseQuote: Quote
  
  init(baseQuote: Quote) {
    self.baseQuote = baseQuote
  }
  
  func convert(numberOfQuotes: Double, convertQuote: Quote) -> Double {
    let result = numberOfQuotes * convertQuote.price_usd / baseQuote.price_usd
    return result
  }
}
