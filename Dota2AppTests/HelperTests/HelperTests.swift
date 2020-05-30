//
//  HelperTests.swift
//  Dota2AppTests
//
//  Created by Mykhaylo Levchuk on 30/05/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import XCTest
@testable import Dota2App

class HelperTests: XCTestCase {
    
    var image: UIImage!
    var prefferedSize: CGSize!
    
    override func setUp() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        image = renderer.image { ctx in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        
        prefferedSize = CGSize(width: 100, height: 100)
    }

    override func tearDown() {
        image = nil
        prefferedSize = nil
    }

    func testResizeImage() {
        let resizeImage = Helper.resizedImageWith(image: image, targetSize: prefferedSize)
        XCTAssertTrue(resizeImage.size == prefferedSize, "Image was successfuly resized")
    }

}
