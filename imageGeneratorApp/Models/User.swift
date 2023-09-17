//
//  User.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-09-04.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
