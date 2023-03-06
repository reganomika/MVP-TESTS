//
//  RouterMainProtocol.swift
//  MPV+Tests
//
//  Created by MacBook on 6.03.23.
//

import Foundation
import UIKit

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}
