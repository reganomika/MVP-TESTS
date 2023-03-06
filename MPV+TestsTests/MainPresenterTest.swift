//
//  MainPresenterTest.swift
//  MPV+TestsTests
//
//  Created by MacBook on 5.03.23.
//

import XCTest
@testable import MPV_Tests

class MockView: MainViewProtocol {

    var isSuccessCalled = false
    var isFailureCalled = false

    func success() {
        isSuccessCalled = true
    }
    func failure(error: Error) {
        isFailureCalled = true
    }
}

class MockNetworkService: NetworkServiceProtocol {

    var comments: [Comment]!

    init() {}

    convenience init(comments: [Comment]) {
        self.init()
        self.comments = comments
    }

    func getComments(completion: @escaping (Result<[MPV_Tests.Comment]?, Error>) -> Void) {
        if let comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0)
            completion(.failure(error))
        }
    }
}

class MainPresenterTest: XCTestCase {

    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()

    override func setUpWithError() throws {
        let nc = UINavigationController()
        let assemblyBuilder = AssemblyBuilder()
        router = Router(navigationController: nc, assemblyBuilder: assemblyBuilder)
    }

    override func tearDownWithError() throws {
        view = nil
        networkService = nil
        presenter = nil
    }

    func testGetSuccessComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Baz", body: "Bar")
        comments.append(comment)

        view = MockView()
        networkService = MockNetworkService(comments: comments)
        presenter = MainPresenter(
            view: view,
            networkService: networkService,
            router: router
        )

        var catchComments: [Comment]?

        networkService.getComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
                self.view.success()
            case .failure:
                break
            }
        }

        XCTAssertTrue(view.isSuccessCalled)
        XCTAssertEqual(catchComments?.count, comments.count)
        XCTAssertNotEqual(catchComments?.count, 0)
    }

    func testGetFailureComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Baz", body: "Bar")
        comments.append(comment)

        view = MockView()
        networkService = MockNetworkService()
        presenter = MainPresenter(
            view: view,
            networkService: networkService,
            router: router
        )

        var catchError: Error?

        networkService.getComments { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                catchError = error
                self.view.failure(error: error)
            }
        }
        XCTAssertTrue(view.isFailureCalled)
        XCTAssertNotNil(catchError)
    }
}
