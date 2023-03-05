//
//  MainViewProtocol.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}
