//
//  ImageViewController.swift
//  PersonalPage
//
//  Created by Дмитрий Олейнер on 22.12.2021.
//

import UIKit

class UserAboutViewController: UIViewController {
    
   
    @IBOutlet weak var aboutOneLabel: UILabel!
    @IBOutlet weak var aboutTwoLabel: UILabel!
    @IBOutlet weak var aboutThreeLabel: UILabel!
    @IBOutlet weak var aboutFourLabel: UILabel!
    
    var user: User!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientBackground()

        aboutOneLabel.text = user.person.aboutOne
        aboutTwoLabel.text = user.person.aboutTwo
        aboutThreeLabel.text = user.person.aboutThree
        aboutFourLabel.text = user.person.aboutFour
    }
}

//MARK: - Gradient Background
extension UserAboutViewController {
        private func gradientBackground(){
        let color1 = UIColor(red: 0 / 255, green: 183 / 255, blue: 142 / 255, alpha: 1).cgColor
        let color2 = UIColor(red: 0 / 255, green: 153 / 255, blue: 121 / 255, alpha: 1).cgColor
        let color3 = UIColor(red: 0 / 255, green: 90 / 255, blue: 121 / 255, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
