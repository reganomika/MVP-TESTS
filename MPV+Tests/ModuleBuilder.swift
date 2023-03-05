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
    static func createDetail(comment: Comment?) -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func createMain() -> UIViewController {
        let view = MainViewController()
        let service = NetworkService()
        let presenter = MainPresenter(view: view, networkService: service)
        view.presenter = presenter
        return view
    }

    static func createDetail(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let service = NetworkService()
        let presenter = DetailViewPresenter(
            view: view,
            networkService: service,
            comment: comment
        )
        view.presenter = presenter
        return view
    }
}
