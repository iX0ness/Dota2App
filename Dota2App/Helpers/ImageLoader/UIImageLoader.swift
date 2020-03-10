//
//  UIImageLoader.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class UIImageLoader {
    static let loader = UIImageLoader()
    
    private let imageLoader = ImageLoader()
    private var uuidMap = [UIImageView: UUID]()
    
    private init(){}
    
    func load(_ url: URL, _ imageSize: ImageLoader.ImageSize, for imageView: UIImageView) {
        let token = imageLoader.loadImage(from: url, with: imageSize) { result in
            
            defer { self.uuidMap.removeValue(forKey: imageView) }
            do {
                
                let image = try result.get()
                DispatchQueue.main.async {
                    imageView.image = image
                }
            } catch {
        
            }
        }
        
        if let token = token {
            uuidMap[imageView] = token
        }
    }
    
    func cancel(for imageView: UIImageView) {
        if let uuid = uuidMap[imageView] {
          imageLoader.cancelLoad(uuid)
          uuidMap.removeValue(forKey: imageView)
        }
    }
}
