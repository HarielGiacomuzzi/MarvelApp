//
//  MainListService.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 04/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation

protocol MainListServiceProtocol {
    func getAllHeros(completion: @escaping ([MarvelCharacter]) -> Void)
}

class MainListService: MainListServiceProtocol {
    private var currentOffset: Int = 0
    private var fetchedHeros: Set<MarvelCharacter> = Set()
    private var provider: CharacterProviderProtocol!

    init(provider: CharacterProviderProtocol = CharacterProvider()) {
        self.provider = provider
    }

    func getAllHeros(completion: @escaping ([MarvelCharacter]) -> Void) {
        provider.getCharacters(offset: currentOffset, limit: 50) { (result) in
            switch result {
            case .success(let characters):
                self.currentOffset += 50
                self.fetchedHeros = self.fetchedHeros.union(characters)
                completion(self.fetchedHeros.sorted(by: { (lhs, rhs) -> Bool in
                    lhs.id > rhs.id
                }))
            case .failure(let error):
                debugPrint("Handle this error properly: \(error.localizedDescription)")
                completion(self.fetchedHeros.sorted(by: { (lhs, rhs) -> Bool in
                    lhs.id > rhs.id
                }))
            }
        }
    }
}
