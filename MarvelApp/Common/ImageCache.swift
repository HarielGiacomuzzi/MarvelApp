//
//  ImageCache.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 04/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import Foundation
import UIKit

class ImageCache {
    static let cache: NSCache<NSString, UIImage> = NSCache<NSString, UIImage>()
    static let imageProvider = MarvelImageProvider()

    private static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }


    static func downloadImage(url: URL, completion: @escaping (UIImage) -> Void) {
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            imageProvider.getImage(url: url) { data in
               guard let data = data else { return }
               DispatchQueue.main.async() {
                    guard let image = UIImage(data: data) else { return }
                    cache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image)
               }
           }
        }
    }
}
