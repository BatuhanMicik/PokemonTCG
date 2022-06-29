//
//  ResponseError.swift
//  PokemonTCG
//
//  Created by Batuhan Mıcık on 9.08.2021.
//

import Foundation

class ResponseError {
    
    var code: String?
    var message: String?
    init(code: String, message: String) {
        self.code = code
        self.message = message
    }
    
}
