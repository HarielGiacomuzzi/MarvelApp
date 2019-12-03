//
//  CharactersProvider.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 03/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation

protocol CharacterProviderProtocol {
    func getCharacters(from: Int, to: Int) -> Result
    func getCharacterById(id: Int) -> Result
}


class CharacterProvider: CharacterProviderProtocol {

    init(backendService: ServiceType = .QA) {
        <#statements#>
    }

    func getCharacters(from: Int, to: Int) -> Result {
        <#code#>
    }

    func getCharacterById(id: Int) -> Result {
        <#code#>
    }
}
