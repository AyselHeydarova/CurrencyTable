//
//  CurrenciesVM.swift
//  CurrencyTable
//
//  Created by Aysel Heydarova on 10/22/20.
//

import UIKit

class CurrenciesVM {
    
    let currenciesArray = [
        ("AZN", #imageLiteral(resourceName: "AZ")),
        ("USD", #imageLiteral(resourceName: "US")),
        ("EUR", #imageLiteral(resourceName: "EU")),
        ("GBP", #imageLiteral(resourceName: "UK")),
        ("RUB", #imageLiteral(resourceName: "RUB")),
        ("CAD", #imageLiteral(resourceName: "CAD")),
        ("CHF", #imageLiteral(resourceName: "CHF")),
        ("JPY",#imageLiteral(resourceName: "JPY"))]
    
    var currencies: [Currency]
    
    init() {
        self.currencies = currenciesArray.map {Currency.init(currency: $0.0, isSelected: false, flagIcon: $0.1)}
    }
    
    func selectCurrency(index: Int) {
        for indexNumber in 0..<currencies.count {
            currencies[indexNumber].isSelected = false
        }
        currencies[index].isSelected = true
       
    }
}
