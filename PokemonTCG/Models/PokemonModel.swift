//
//  PokemonModel.swift
//  PokemonTCG
//
//  Created by Batuhan Mıcık on 9.08.2021.
//

import Foundation

struct PokemonModel: Codable{
    var cards: [PokemonElements]?
}

struct PokemonElements: Codable {
    var id: String?
    var hp: String?
    var name: String?
    var imageUrl: String?
    var artist: String?
}
