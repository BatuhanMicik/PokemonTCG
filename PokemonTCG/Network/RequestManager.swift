//
//  RequestManager.swift
//  PokemonTCG
//
//  Created by Batuhan Mıcık on 6.08.2021.
//

import Foundation
import Alamofire

class RequestManager {
    static func fetchPokemons(hpValue: String, response: @escaping([PokemonElements]?) -> Void, failureBlock: @escaping(ResponseError) -> Void) {
        let baseUrl = "https://api.pokemontcg.io/v1/cards?hp=gte\(hpValue)"
        
        AF.request(baseUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            switch responseData.result {
            case .success:
                do {
                    let pokemonData = try JSONDecoder().decode(PokemonModel.self, from: responseData.data!)
                    response(pokemonData.cards)
                    
                } catch {
                    print("*****************Error Decoding***************** == \(error)*********************")
                }
            case .failure:
                print("**************Error*************")
                let errorBlock = ResponseError(code: "", message: "")
                failureBlock(errorBlock)
            }
        }
    }
}
