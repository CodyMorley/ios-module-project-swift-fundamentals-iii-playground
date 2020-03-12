import UIKit

enum Currency {
    case usd
    case cad
    case mxn
}

let usToCad = 1.38
let usToMxn = 21.58

var currency = Currency.mxn

func convert(_ dollars: Double) -> Double {
    
    switch currency {
    case .cad:
       return dollars * usToCad
    case .mxn:
        return dollars * usToMxn
    case .usd:
        return dollars
    }
}

var currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
}()

func convert(amountString: String) -> String? {
    
    guard let amount = Double(amountString) else {
        return "Not a valid number"
    }
    
    return currencyFormatter.string(from: NSNumber(value: amount))
}

convert(amountString: "14.55")
print(convert(amountString: "14.55")!)
