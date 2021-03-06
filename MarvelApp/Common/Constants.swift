//
//  Constants.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 03/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation

enum ServiceType {
    case Production
    case QA
}

struct KeyNames {
    static let MarvelKey = "MARVEL_SERVICE_KEY"
    static let MarvelBasePath = "MARVEL_BASE_PATH"
    static let MarvelPrivateKey = "MARVEL_PRIVATE_KEY"
}

struct CellIdentifiers {
    static let MainListCell = "heroCell"
}

struct SegueIdentifiers {
    static let detailView = "gotoDetail"
}

struct Environment {

    //MARK: QA Keys
    static var MarvelQAKey: String = Environment.variable(named: KeyNames.MarvelKey) ?? CI.MarvelServiceKey
    static var MarvelPrivateQAKey: String = Environment.variable(named: KeyNames.MarvelPrivateKey) ?? CI.MarvelPrivateKey

    //MARK: Production Keys
    static var MarvelProdKey: String = ""

    //MARK: Commom Values
    static var MarvelBasePath: String = Environment.variable(named: KeyNames.MarvelBasePath) ?? CI.MarvelBasePath

    static func variable(named name: String) -> String? {
        let processInfo = ProcessInfo.processInfo
        guard let value = processInfo.environment[name] else {
            return nil
        }
        return value
    }

    static func getMarvelHash() -> (String, String) {
        let uuid = UUID().uuidString
        return (uuid, "\(uuid)\(MarvelPrivateQAKey)\(MarvelQAKey)".md5)
    }
}
