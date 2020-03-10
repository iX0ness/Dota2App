//
//  ImageLoader.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

class ImageLoader {
    
    enum ImageSize {
        case original
        case custom(size: CGSize)
    }
    
    typealias ImageCompletion = (Result<UIImage, Error>) -> Void
    
    private var loadedImages = [URL: UIImage]()
    private var runningRequests = [UUID: URLSessionDataTask]()
    
    
    
    func loadImage(from url: URL, with size: ImageSize, _ completion: @escaping ImageCompletion) -> UUID? {
        if let image = loadedImages[url] {
            completion(.success(image))
            return nil
        }
        
        let uuid = UUID()
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            defer {self.runningRequests.removeValue(forKey: uuid)}
            
            if let data = data, let image = UIImage(data: data) {
                self.loadedImages[url] = self.convertImage(image, to: size)
                completion(.success(image))
                return
            }
            
            guard let error = error else {return}
            
            guard (error as NSError).code == NSURLErrorCancelled else {
                completion(.failure(error))
                return
            }
            
        }
        task.resume()
        
        runningRequests[uuid] = task
        return uuid
    }
    
    func cancelLoad(_ uuid: UUID) {
      runningRequests[uuid]?.cancel()
      runningRequests.removeValue(forKey: uuid)
    }
    
    private func convertImage(_ image: UIImage, to size: ImageSize) -> UIImage {
        switch size {
        case .original:
            return image
            
        case .custom(size: let size):
            let resizedImage = Helper.resizedImageWith(image: image, targetSize: size)
            return resizedImage
        }
    }
}
