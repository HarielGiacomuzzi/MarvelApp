//
//  MainListViewModel.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 04/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation

protocol MainListViewModelDelegate {
    func didFetchedHeros()
}

class MainListViewModel {
    var heros: [MarvelCharacter] = [] {
        didSet {
            delegate?.didFetchedHeros()
        }
    }
    var delegate: MainListViewModelDelegate?
    var service: MainListServiceProtocol?

    init(service: MainListServiceProtocol = MainListService()) {
        self.service = service
    }

    func getHeros() {
        service?.getAllHeros(completion: { (heros) in
            self.heros = heros
        })
    }

}
