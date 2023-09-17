//
//  Extentions.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-09-05.
//

import Foundation


extension Encodable{
    func asDictionary() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch{
            return[:]
        }
    }
}
