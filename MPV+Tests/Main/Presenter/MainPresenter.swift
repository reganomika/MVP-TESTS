//
//  MainPresenter.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation

class MainPresenter: MainViewPresenterProtocol {

    let view: MainViewProtocol
    let person: Person

    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }

    func showGreeting() {
        let greeting = person.firstName + " " + person.lastName
        view.setGreeting(greeting: greeting)
    }
}
