//
//  RouterProtocol.swift
//  MPV+Tests
//
//  Created by MacBook on 6.03.23.
//

import Foundation

protocol RouterProtocol: RouterMainProtocol {
    func initialViewController()
    func showDetail(comment: Comment?)
    func popToRoot()
}
