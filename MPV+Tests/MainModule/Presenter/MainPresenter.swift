//
//  MainPresenter.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation

class MainPresenter: MainViewPresenterProtocol {

    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    var comments: [Comment]?
    var router: RouterProtocol

    required init(
        view: MainViewProtocol,
        networkService: NetworkServiceProtocol,
        router: RouterProtocol
    ) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }

    func tapOnTheComment(comment: Comment?) {
        router.showDetail(comment: comment)
    }

    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
