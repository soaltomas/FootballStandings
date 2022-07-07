//
//  ImageProvider.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import UIKit

class ImageProvider {
    
    static let shared = ImageProvider()
    
    private var imageCache = [String: UIImage]()
    private let threadSafeImageQueue = DispatchQueue(label: "threadSafeImageQueue",
                                                     attributes: .concurrent)
    
    private init(){}
    
    func getImage(for url: URL?, completion: ((UIImage?, String?) -> Void)?) {
        guard let url = url else {
            return
        }
        
        threadSafeImageQueue.sync {
            if imageCache.keys.contains(url.absoluteString), let image = imageCache[url.absoluteString] {
                completion?(image, url.absoluteString)
            }
        }
        
        if imageCache.keys.contains(url.absoluteString) {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard error == nil, let imageData = data, let image = UIImage(data: imageData) else {
                completion?(nil, nil)
                return
            }
            
            self?.threadSafeImageQueue.async(flags: .barrier) {
                self?.imageCache[url.absoluteString] = image
                completion?(image, url.absoluteString)
            }
        }.resume()
    }
    
    func downloadImages(for urls: [URL?]) {
        for url in urls {
            if let url = url {
                getImage(for: url, completion: nil)
            }
        }
    }
}
