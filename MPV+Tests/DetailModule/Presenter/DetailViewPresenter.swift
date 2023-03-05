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
    var comment: Comment?

    required init(
        view: DetailViewProtocol,
        networkService: NetworkServiceProtocol,
        comment: Comment?
    ) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }

    func setComment() {
        self.view?.setComment(comment: comment)
    }
}
