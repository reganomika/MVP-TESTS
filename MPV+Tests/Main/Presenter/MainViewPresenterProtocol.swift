//
//  MainViewPresenterProtocol.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)

    func showGreeting()
}
