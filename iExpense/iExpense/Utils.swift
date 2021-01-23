//
//  Utils.swift
//  iExpense
//
//  Created by Julius Huizing on 17/01/2021.
//

import Foundation

enum iExpenseError: Error {
    case couldNotEncodeData
    case couldNotDecodeData
}

// Encodes array of expenses to JSON format
func encodeItems (items : [Expense]) throws -> Data {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(items) {
        return encoded
    }
    throw iExpenseError.couldNotEncodeData
}
// Saves data in UserDefaults
func saveData(save data:Data, as key: String) {
    UserDefaults.standard.set(data, forKey: key)
}

func getData(key name: String) -> Data? {
    if let data = UserDefaults.standard.data(forKey: name) {
        return data }
    return nil
}

func decodeItems(encoded: Data) throws -> [Expense] {
    let decoder = JSONDecoder()
    if let decoded = try? decoder.decode([Expense].self, from: encoded) {
        return decoded
    }
    throw iExpenseError.couldNotDecodeData
}
