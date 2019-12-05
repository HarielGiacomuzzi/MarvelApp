//
//  CharacterDetailViewModel.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 05/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation

protocol CharacterDetailViewModelDelegate {
    func didFetchedHero()
}

class CharacterDetailViewModel {
    var hero: MarvelCharacter?

    private let service: MainListServiceProtocol!

    init(service: MainListServiceProtocol = MainListService(), hero: MarvelCharacter?) {
        self.service = service
        self.hero = hero
    }
}
