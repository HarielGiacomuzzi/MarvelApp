// This file was generated from JSON Schema using quicktype, do not modify it directly.
//
//  Character.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 03/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation

// MARK: - Character
class Character: Codable {
    let code: Int
    let status, copyright, attributionText: String
    let attributionHTML: String
    let data: DataClass
    let etag: String

    init(code: Int, status: String, copyright: String, attributionText: String, attributionHTML: String, data: DataClass, etag: String) {
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHTML = attributionHTML
        self.data = data
        self.etag = etag
    }
}

// MARK: - DataClass
class DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [MarvelCharacter]

    init(offset: Int, limit: Int, total: Int, count: Int, results: [MarvelCharacter]) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

// MARK: - Result
class MarvelCharacter: Codable, Hashable {
    let id: Int
    let name, resultDescription, modified: String
    let resourceURI: String
    let urls: [URLElement]
    let thumbnail: Thumbnail
    let comics: Comics
    let stories: Stories
    let events, series: Comics

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, resourceURI, urls, thumbnail, comics, stories, events, series
    }

    init(id: Int, name: String, resultDescription: String, modified: String, resourceURI: String, urls: [URLElement], thumbnail: Thumbnail, comics: Comics, stories: Stories, events: Comics, series: Comics) {
        self.id = id
        self.name = name
        self.resultDescription = resultDescription
        self.modified = modified
        self.resourceURI = resourceURI
        self.urls = urls
        self.thumbnail = thumbnail
        self.comics = comics
        self.stories = stories
        self.events = events
        self.series = series
    }

    static func == (lhs: MarvelCharacter, rhs: MarvelCharacter) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Comics
class Comics: Codable {
    let available, returned: Int
    let collectionURI: String
    let items: [ComicsItem]

    init(available: Int, returned: Int, collectionURI: String, items: [ComicsItem]) {
        self.available = available
        self.returned = returned
        self.collectionURI = collectionURI
        self.items = items
    }
}

// MARK: - ComicsItem
class ComicsItem: Codable {
    let resourceURI, name: String

    init(resourceURI: String, name: String) {
        self.resourceURI = resourceURI
        self.name = name
    }
}

// MARK: - Stories
class Stories: Codable {
    let available, returned: Int
    let collectionURI: String
    let items: [StoriesItem]

    init(available: Int, returned: Int, collectionURI: String, items: [StoriesItem]) {
        self.available = available
        self.returned = returned
        self.collectionURI = collectionURI
        self.items = items
    }
}

// MARK: - StoriesItem
class StoriesItem: Codable {
    let resourceURI, name, type: String

    init(resourceURI: String, name: String, type: String) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
}

// MARK: - Thumbnail
class Thumbnail: Codable {
    let path, thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }

    init(path: String, thumbnailExtension: String) {
        self.path = path
        self.thumbnailExtension = thumbnailExtension
    }
}

// MARK: - URLElement
class URLElement: Codable {
    let type, url: String

    init(type: String, url: String) {
        self.type = type
        self.url = url
    }
}
