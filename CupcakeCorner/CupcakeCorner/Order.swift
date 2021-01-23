//
//  Order.swift
//  CupcakeCorner
//
//  Created by Julius Huizing on 23/01/2021.
//

import Foundation

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case typeIdx, quantity, extraToppingsEnabled, toppingSprinkles, toppingFrostings, name, city, zip, adress, specialRemarks

    }
    static let types = ["Vanilla", "Chocolate", "Red Velvet"]
    @Published var typeIdx = 0
    
    @Published var quantity = 3
    
    @Published var extraToppingsEnabled = false {
        didSet {
            if !extraToppingsEnabled {
                toppingSprinkles = false
                toppingFrosting = false
            }
        }
    }
    @Published var toppingSprinkles = false
    @Published var toppingFrosting = false
    
    @Published var name = ""
    @Published var city = ""
    @Published var zip = ""
    @Published var adress = ""
    
    @Published var specialRemarks = ""
    
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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(typeIdx, forKey: .typeIdx)
        try container.encode(quantity, forKey: .quantity)

        try container.encode(toppingFrosting, forKey: .toppingFrostings)
        try container.encode(toppingSprinkles, forKey: .toppingSprinkles)

        try container.encode(name, forKey: .name)
        try container.encode(adress, forKey: .adress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        typeIdx = try container.decode(Int.self, forKey: .typeIdx)
        quantity = try container.decode(Int.self, forKey: .quantity)

        toppingFrosting = try container.decode(Bool.self, forKey: .toppingFrostings)
        toppingSprinkles = try container.decode(Bool.self, forKey: .toppingSprinkles)

        name = try container.decode(String.self, forKey: .name)
        adress = try container.decode(String.self, forKey: .adress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
}
