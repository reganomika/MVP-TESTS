//
//  DetailViewPresenterProtocol.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation

protocol DetailViewPresenterProtocol: AnyObject {
    init(
        view: DetailViewProtocol,
        networkService: NetworkServiceProtocol,
        comment: Comment?
    )

    func setComment()
}
