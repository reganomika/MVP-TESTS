//
//  RouterTests.swift
//  MPV+TestsTests
//
//  Created by MacBook on 6.03.23.
//

import XCTest
@testable import MPV_Tests

class MocNavigationController: UINavigationController {
    var presentedVC: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

final class RouterTests: XCTestCase {

    var router: RouterProtocol!
    var navigationController = MocNavigationController()

    override func setUpWithError() throws {
        let assembly = AssemblyBuilder()
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detailViewController = navigationController.presentedVC
        XCTAssertTrue(detailViewController is DetailViewController)
    }

}
