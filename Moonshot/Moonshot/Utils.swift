//
//  Decoder.swift
//  Moonshot
//
//  Created by Julius Huizing on 19/01/2021.
//

import Foundation

struct Astronaut: Identifiable, Decodable {
    var id: String
    var name: String
    var description: String
    var imageName: String {
        id
    }
}

struct Mission: Decodable, Identifiable {
    struct CrewMember: Decodable {
        var name: String
        var role: String
    }
    var id: Int
    var launchDate: String?
    var crew: [CrewMember]
    var description: String
    
    var name: String {
        "Appolo \(self.id)"
    }
    var imageName: String {
        "apollo\(self.id)"
    }
}

extension Bundle {
    func decode<T:Decodable>(_ file:String) -> [T] {
        guard let url = self.url(forResource: file, withExtension: nil)
        else {
            fatalError("Failed to locate \(file) in Bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to transform \(file) to proper format.")
        }
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode([T].self, from: data) else {
            fatalError("Could not decode data from \(file).")
        }
        return decoded
    }
}


