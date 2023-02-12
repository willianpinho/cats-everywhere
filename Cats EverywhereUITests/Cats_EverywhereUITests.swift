//
//  Cats_EverywhereUITests.swift
//  Cats EverywhereUITests
//
//  Created by Willian Junior Peres de Pinho on 09/02/23.
//

import XCTest
@testable import Cats_Everywhere

class YourClassNameTests: XCTestCase {
    
    var viewController: DetailViewController!
    
    override func setUp() {
        super.setUp()
        let imageObject = ImageObject(id: "Test", title: "Test", images: [])
        let viewModel = DetailViewModel(imageObject: imageObject)
        let detailVC = DetailViewController(viewModel: viewModel)
        detailVC.loadViewIfNeeded()
    }
    
    func testShowAlertImageIsVideo() {
        let expectation = XCTestExpectation(description: "Show Alert Image Is Video")
        viewController.showAlertImageIsVideo()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let presentedViewController = self.viewController.presentedViewController
            XCTAssertNotNil(presentedViewController)
            XCTAssertTrue(presentedViewController is UIAlertController)
            let alertController = presentedViewController as! UIAlertController
            XCTAssertEqual(alertController.title, "Error")
            XCTAssertEqual(alertController.message, "Image is a video, sorry for not present")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
