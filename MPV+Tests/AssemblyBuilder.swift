//
//  ModuleBuilder.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController
    func createDetail(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createMain(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let service = NetworkService()
        let presenter = MainPresenter(
            view: view,
            networkService: service,
            router: router
        )
        view.presenter = presenter
        return view
    }

    func createDetail(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let service = NetworkService()
        let presenter = DetailViewPresenter(
            view: view,
            networkService: service,
            router: router,
            comment: comment
        )
        view.presenter = presenter
        return view
    }
}
