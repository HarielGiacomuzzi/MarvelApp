//
//  MarvelImageProvider.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 05/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation

class MarvelImageProvider: BaseProvider {

    override init() {
        super.init()
    }

    func getImage(url: URL, backendService: ServiceType = .QA, completion: @escaping (Data?) -> Void) {
        var  serviceKey: String = ""
        switch backendService {
        case .QA:
            serviceKey = Environment.MarvelQAKey
        case .Production:
            serviceKey = Environment.MarvelProdKey
        }

        let hashComponents = Environment.getMarvelHash()
        let params: Dictionary<String, String> = [
            "apikey": serviceKey,
            "ts": hashComponents.0,
            "hash": hashComponents.1
        ]

        callAPI(queryString: params, urlPath: url.absoluteString) { (result) in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                debugPrint("Error while getting image: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
