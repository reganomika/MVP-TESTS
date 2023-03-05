//
//  ModuleBuilder.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation
import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func createMain() -> UIViewController {
        let model = Person(firstName: "David", lastName: "Blane")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
