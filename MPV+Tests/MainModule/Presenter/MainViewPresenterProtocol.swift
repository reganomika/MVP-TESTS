//
//  MainViewPresenterProtocol.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    var comments: [Comment]? { get set }
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
}
