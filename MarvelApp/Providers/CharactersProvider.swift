//
//  CharactersProvider.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 03/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation

protocol CharacterProviderProtocol {
    func getCharacters(offset: Int, limit: Int, completion: @escaping (Result<[MarvelCharacter], Error>) -> Void )
    func getCharacterById(id: Int, completion: @escaping (Result<MarvelCharacter, Error>) -> Void)
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

    func getCharacters(offset: Int, limit: Int = 100, completion: @escaping (Result<[MarvelCharacter], Error>) -> Void) {
        var params = baseParams

        let hashComponents = Environment.getMarvelHash()

        params!["offset"] = "\(offset)"
        params!["limit"] = "\(limit)"
        params!["ts"] = hashComponents.0
        params!["hash"] = hashComponents.1

        callAPI(
            queryString: params,
            urlPath: "\(basePath ?? "")/v1/public/characters") { res in
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

    func getCharacterById(id: Int, completion: @escaping (Result<MarvelCharacter, Error>) -> Void) {
        ///v1/public/characters/
        var params = baseParams

        let hashComponents = Environment.getMarvelHash()
        params!["ts"] = hashComponents.0
        params!["hash"] = hashComponents.1

        callAPI(
            queryString: params,
            urlPath: "\(basePath ?? "")/v1/public/characters/\(id)") { res in
                switch res {
                case .failure(let error):
                    debugPrint("There's an error getting character: \(error.localizedDescription)")
                case .success(let data):
                    do {
                        let resp = try JSONDecoder().decode(Character.self, from: data)
                        guard let character = resp.data.results.first else { return }
                        completion(.success(character))
                    } catch let error {
                        debugPrint("There's an error while decoding marvel character response: \(error.localizedDescription)")
                        completion(.failure(error))
                    }
                }
        }
    }
}
