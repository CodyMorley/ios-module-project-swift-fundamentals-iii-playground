import UIKit

enum Currency {
    case usd
    case cad
    case mxn
    case eur
}

let usToCad = 1.38
let usToMxn = 21.58
let usToEur = 0.90

var currency = Currency.eur

func convert(_ dollars: Double) -> Double {
    
    switch currency {
    case .cad:
       return dollars * usToCad
    case .mxn:
        return dollars * usToMxn
    case .eur:
        return dollars * usToEur
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
    
    let currency = convert(amount) ?? 0
    return currencyFormatter.string(from: NSNumber(value: currency))
}

convert(amountString: "100")
print(convert(amountString: "100")!)

