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
        callAPI(queryString: nil, urlPath: url.absoluteString) { (result) in
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
