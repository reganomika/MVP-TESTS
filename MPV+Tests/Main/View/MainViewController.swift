//
//  ViewController.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - IBOutlet

    @IBOutlet weak var label: UILabel!

    //MARK: - Properties

    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapButton(_ sender: Any) {
        presenter?.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        label.text = greeting
    }
}

