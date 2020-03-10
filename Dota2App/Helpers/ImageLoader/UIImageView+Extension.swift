//
//  UIImageView+Extension.swift
//  Dota2App
//
//  Created by Mykhaylo Levchuk on 10/03/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(at url: URL, with size: ImageLoader.ImageSize) {
        UIImageLoader.loader.load(url, size, for: self)
  }

  func cancelImageLoad() {
    UIImageLoader.loader.cancel(for: self)
  }
}
