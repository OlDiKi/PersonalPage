//
//  ViewController.swift
//  PersonalPage
//
//  Created by Дмитрий Олейнер on 18.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

//MARK: - IB Outlets
    @IBOutlet var userNameTitle: UITextField!
    @IBOutlet var passwordTitle: UITextField!
    
//MARK: - Private properties
    private let user = User.getUserData()
 
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }

        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.welcomeUser = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserImageViewController
                userInfoVC.user = user
            }
        }
    }
    
//MARK: - Display
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientBackground()
    }
    
 //MARK: - IBActions
    @IBAction func logInTap() {
        if userNameTitle.text != user.login || passwordTitle.text != user.password {
            showAlert(title: "Invalid login or pasword", message: "Please, enter correct login and password", textField: passwordTitle)
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }

    
    @IBAction func forgotUserNameTap(_ sender: UIButton) {
        showAlert(title: "Oops!", message: "You User Name is \(user.login)")
    }
    
    @IBAction func forgotPasswordTap() {
        showAlert(title: "It's so sad!", message: "Your password is \(user.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTitle.text = ""
        passwordTitle.text = ""
    }
}
    
// MARK: - Private Methods
        
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Fine", style: .default) { _ in textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
        }

// MARK: - Gradient Background
    
    private func gradientBackground () {
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

// MARK: - Alert Controller
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTitle {
            passwordTitle.becomeFirstResponder()
        } else {
            logInTap()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}

