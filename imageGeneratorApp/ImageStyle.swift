//
//  ImageStyle.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-08-08.
//

import Foundation

enum ImageStyle: String, CaseIterable{
    case surrealism
    case realism
    case threeDRender
    case abstract
    case retro
    case geometric

    
    var title: String{
        switch self {
        case .surrealism:
            return "Surrealism"
        case .realism:
            return "Realism"
        case .threeDRender:
            return "3D render"
        case .abstract:
            return "Abstract"
        case .retro:
            return "Retro"
        case .geometric:
            return "Geometric"
        }
    }
}
