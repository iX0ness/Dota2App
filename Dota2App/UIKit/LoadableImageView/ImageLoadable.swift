//
//  ImageLoadable.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 03/04/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

protocol Loadable {
    var currentTask: URLSessionDataTask? {get}
    var imageURLString: String? {get}
    
    func loadImage(from urlString: String, completion: @escaping (UIImage) -> Void)
}
