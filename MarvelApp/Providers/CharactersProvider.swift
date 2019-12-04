//
//  CharactersProvider.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 03/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation

protocol CharacterProviderProtocol {
    func getCharacters(offset: Int, completion: @escaping (Result<[MarvelCharacter], Error>) -> Void )
    func getCharacterById(id: Int, completion: @escaping (Result<Data, Error>) -> Void)
}


class CharacterProvider: BaseProvider, CharacterProviderProtocol {
    private var serviceKey: String!
    private var basePath: String!
    private var baseParams: Dictionary<String, String>!

    init(backendService: ServiceType = .QA) {
        switch backendService {
        case .QA:
            serviceKey = Environment.MarvelQAKey
        case .Production:
            serviceKey = Environment.MarvelProdKey
        }

        basePath = Environment.MarvelBasePath
        baseParams = [
            "apikey": serviceKey
        ]
    }

    func getCharacters(offset: Int, completion: @escaping (Result<[MarvelCharacter], Error>) -> Void) {
        var params = baseParams
        params!["offset"] = "\(offset)"
        params!["limit"] = "50"

        callAPI(
            queryString: params,
            urlPath: "\(String(describing: basePath))/v1/public/characters") { res in
                switch res {
                case .failure(let error):
                    debugPrint("There's an error getting characters list: \(error.localizedDescription)")
                case .success(let data):
                    do {
                        let characters = try JSONDecoder().decode(Character.self, from: data)
                        completion(.success(characters.data.results))
                    } catch let error {
                        debugPrint("There's an error while decoding marvel character response: \(error.localizedDescription)")
                        completion(.failure(error))
                    }
                }
        }
    }

    func getCharacterById(id: Int, completion: @escaping (Result<Data, Error>) -> Void) {
        //TODO: Continue 
    }
}
