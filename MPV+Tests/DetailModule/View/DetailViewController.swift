//
//  DetailViewController.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!

    var presenter: DetailViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        textLabel.text = comment?.body
    }
}
