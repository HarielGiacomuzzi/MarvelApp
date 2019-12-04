//
//  CI.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 03/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation

struct CI {
    static var MarvelServiceKey: String = "$(\(KeyNames.MarvelKey))"
    static var MarvelPrivateKey: String = "$(\(KeyNames.MarvelPrivateKey))"
    static var MarvelBasePath: String = "$(\(KeyNames.MarvelBasePath))"
}
