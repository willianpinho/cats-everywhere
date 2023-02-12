//
//  Cats_EverywhereTests.swift
//  Cats EverywhereTests
//
//  Created by Willian Junior Peres de Pinho on 12/02/23.
//

import XCTest
@testable import Cats_Everywhere

class Cats_EverywhereTests: XCTestCase {
    
    func testSetup_WithValidURL_ReturnsValidResource() {
        let imageTest = Image(link: "https://www.example.com/image.jpg")
        let imageView = UIImageView()
        let imageObject = ImageObject(id: "Test", title: "Test", images: [imageTest])
        let detailViewModel = DetailViewModel(imageObject: imageObject)
        let resource = detailViewModel.setup(with: imageTest, imageView: imageView)
        
        XCTAssertNotNil(resource)
        XCTAssertEqual(resource?.downloadURL.absoluteString, "https://www.example.com/image.jpg")
    }
}
