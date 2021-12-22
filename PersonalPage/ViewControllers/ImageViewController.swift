//
//  ImageViewController.swift
//  PersonalPage
//
//  Created by Дмитрий Олейнер on 22.12.2021.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
    }
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: user.person.image)
    }
}
