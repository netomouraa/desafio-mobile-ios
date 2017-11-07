//
//  ViewControllerTests.swift
//  GitHubAPITests
//
//  Created by Neto Moura on 07/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import XCTest
@testable import GitHubAPI

class ViewControllerTests: XCTestCase {
    
    func getViewController() -> MainViewController? {
        guard let vc = UIStoryboard(name: "MainViewController", bundle: nil).instantiateViewController(withIdentifier: "Main") as? MainViewController else {
            XCTAssert(false, "No viewController with that identifier")
            return nil
        }
        return vc
    }

    
//    class MockMessagePresenter: Repositories {
//
//        var presentCalled = false
//        var repo: Repositories?
//        var viewController: UIViewController?
//
//        func presentRepo(_ repo: Repositories, on viewController: UIViewController) {
//            presentCalled = true
//            self.repo = repo
//            self.viewController = viewController
//        }
//
//    }
//
//    func testCallingPresenter() {
//        // Arrange
//        guard let sut = getViewController() else { return }
//        let repoPresenter = Repositories?()
//        sut.ArrayRepositories = repoPresenter
//
//        // Act
////        sut.displayAlert()
//
//        // Assert
//        XCTAssert(presentRepo.presentCalled, "It should have called presentMessage()")
//        XCTAssert(presentRepo.repo == "Something happened!", "It should have passed the right message.")
//        XCTAssert(presentRepo.viewController == sut, "It should the right viewController.")
//
//    }
//
//    func displayAlert() {
//        let repoPresenter: Repositories?
//        repoPresenter?.total_count("Something happened!", on: self)
//    }

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
