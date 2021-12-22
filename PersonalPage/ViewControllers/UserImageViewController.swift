//
//  UserInfoViewController.swift
//  PersonalPage
//
//  Created by Дмитрий Олейнер on 22.12.2021.
//

import UIKit

class UserImageViewController: UIViewController {
   
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
        
        gradientBackground()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? UserAboutViewController else { return }
        imageVC.user = user
    }
}
    
    //MARK: - Gradient Background
    extension UserImageViewController {
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
