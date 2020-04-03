//
//  Loadable.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 02/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

protocol ImageLoadable {
    var currentDataTask: URLSessionDataTask? {get set}
    var imageURLString: String? {get set}
    
    func loadImage(from urlString: String)
}

extension ImageLoadable where Self: UIImageView {
    
    mutating func loadImage(from urlString: String) {
        weak var oldTask = currentDataTask
        guard let unwrappedOldTask = oldTask else {return}
        
        currentDataTask = nil
        unwrappedOldTask.cancel()
        
        if let cachedImage = ImageCache.shared.getImageForKey(forKey: urlString) {
            image = cachedImage
            return
        }
        
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { [weak self ] (data, response, error) in
                guard let self = self else {return}
                
                if let unwrappedError = error {
                    print(unwrappedError)
                    return
                }

                if let unwrappedData = data, let downloadedImage = UIImage(data: unwrappedData) {
                    DispatchQueue.main.async {
                        ImageCache.shared.save(image: downloadedImage, forKey: urlString)
                        if self.imageURLString == urlString {
                            self.image = downloadedImage
                        }
                    }
                }

            }
            
            currentDataTask = dataTask
            dataTask.resume()
        }
    }
}


