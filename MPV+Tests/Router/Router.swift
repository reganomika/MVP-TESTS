//
//  Router.swift
//  MPV+Tests
//
//  Created by MacBook on 6.03.23.
//

import Foundation
import UIKit

class Router: RouterProtocol {

    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?

    init(navigationController: UINavigationController?, assemblyBuilder: AssemblyBuilderProtocol?) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func initialViewController() {
        if let navigationController = navigationController {
            guard let viewController = assemblyBuilder?.createMain(router: self) else {
                return
            }
            navigationController.viewControllers = [viewController]
        }
    }

    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let viewController = assemblyBuilder?.createDetail(comment: comment, router: self) else {
                return
            }
            navigationController.pushViewController(viewController, animated: true)
        }
    }

    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}

