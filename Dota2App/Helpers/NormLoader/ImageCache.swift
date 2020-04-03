//
//  ImageCache.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 02/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class ImageCache {
    private let cache = NSCache<NSString, UIImage>()
    private var observer: NSObjectProtocol!
    
    static let shared = ImageCache()
    
    private init() {
        observer = NotificationCenter.default.addObserver(forName: UIApplication.didReceiveMemoryWarningNotification,
                                                          object: nil,
                                                          queue: nil,
                                                          using: { [weak self] notification in
                                                            guard let self = self else {return}
                                                            self.cache.removeAllObjects()
        })
    }
    
    deinit {
        guard let observer = observer else {return}
        NotificationCenter.default.removeObserver(observer)
    }
    
    func getImageForKey(forKey key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
    
    func save(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
}
