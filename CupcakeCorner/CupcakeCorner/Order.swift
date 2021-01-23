//
//  Order.swift
//  CupcakeCorner
//
//  Created by Julius Huizing on 23/01/2021.
//

import Foundation

struct OrderContent: Codable {
    static let types = ["Vanilla", "Chocolate", "Red Velvet"]
    var typeIdx = 0
    
    var quantity = 3
    
    var extraToppingsEnabled = false {
        didSet {
            if !extraToppingsEnabled {
                toppingSprinkles = false
                toppingFrosting = false
            }
        }
    }
    var toppingSprinkles = false
    var toppingFrosting = false
    
    var name = ""
    var city = ""
    var zip = ""
    var adress = ""
    
    var specialRemarks = ""
    
    var enoughInformationProvided: Bool {
        if name.isEmpty || adress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    var totalCost: Double {
        var cost = Double(quantity * 2)
        if extraToppingsEnabled {
            cost += 0.5 * Double(quantity)
        }
        return cost
    }
}

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case content
    }
    @Published var content = OrderContent()
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(content, forKey: .content)
    }
    
    init () {}
    
    required init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        content = try container!.decode(OrderContent.self, forKey: .content)
    }
}
