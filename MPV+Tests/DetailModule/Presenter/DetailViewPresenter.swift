//
//  DetailViewPresenter.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation

class DetailViewPresenter: DetailViewPresenterProtocol {

    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol
    var router: RouterProtocol
    var comment: Comment?

    required init(
        view: DetailViewProtocol,
        networkService: NetworkServiceProtocol,
        router: RouterProtocol,
        comment: Comment?
    ) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }

    func tap() {
        router.popToRoot()
    }

    func setComment() {
        view?.setComment(comment: comment)
    }
}
