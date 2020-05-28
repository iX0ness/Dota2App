//
//  LoadableImageView.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 03/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class LoadableImageView: UIImageView, Loadable {
    
    var currentTask: URLSessionDataTask?
    var imageURLString: String?
    
    func loadImage(from urlString: String, completion: @escaping (UIImage) -> Void) {
        
        weak var oldTask = currentTask
        currentTask = nil
        oldTask?.cancel()
        
        imageURLString = urlString
        image = nil

        if let cachedImage = ImageCache.shared.getImageForKey(forKey: urlString) {
            image = cachedImage
            return
        }

        if let url = URL(string: urlString) {
            let session = URLSession.shared
            DispatchQueue.global().async {
                let dataTask = session.dataTask(with: url) { (data, response, error) in
                    if let unwrappedError = error {
                        print(unwrappedError)
                        return
                    }

                    if let unwrappedData = data, let downloadedImage = UIImage(data: unwrappedData) {
                            ImageCache.shared.save(image: downloadedImage, forKey: urlString)
                            if self.imageURLString == urlString {
                                DispatchQueue.main.async {
                                    completion(downloadedImage)
                                }
                            }
                    }
                }
                self.currentTask = dataTask
                dataTask.resume()
            }
        }
    }
    
}
