//
//  LoginViewController.swift
//  Design+Code
//
//  Created by Volodymyr Myroniuk on 26.07.2023.
//

import UIKit
import FirebaseAuth
import Combine

enum LoginStatus {
    case signUp
    case signIn
}

class LoginViewController: UIViewController {
    @IBOutlet var loginCard: CustomView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var primaryBtn: UIButton!
    @IBOutlet var accessoryBtn: UIButton!
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    var emailIsEmpty = true
    var passwordIsEmpty = true
    var loginStatus: LoginStatus = .signUp {
        didSet {
            self.titleLabel.text = (loginStatus == .signUp) ? "Sign up" : "Sign in"
            self.primaryBtn.setTitle((loginStatus == .signUp) ? "Create account" : "Sign in", for: .normal)
            self.accessoryBtn.setTitle((loginStatus == .signUp) ? "Don't have an account?" : "Already have an account?", for: .normal)
            self.passwordTextfield.textContentType = (loginStatus == .signUp) ? .newPassword : .password
        }
    }
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseInOut) {
            self.loginCard.alpha = 1
            self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -400)
        }
        
        emailTextfield.publisher(for: \.text)
            .sink { newValue in
                self.emailIsEmpty = (newValue == "" || newValue == nil)
            }
            .store(in: &tokens)
        
        passwordTextfield.publisher(for: \.text)
            .sink { newValue in
                self.passwordIsEmpty = (newValue == "" || newValue == nil)
            }
            .store(in: &tokens)
    }
    
    private func goToHomeScreen() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarViewController") as! CustomTabBarViewController
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction private func primaryButtonAction(_ sender: UIButton) {
        if (emailIsEmpty || passwordIsEmpty) {
            let alert = UIAlertController(title: "Missing Information", message: "Please make sure to enter a valid email address and a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            if loginStatus == .signUp {
                Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authResult, error in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    // Segue over to the home screen
                    self.goToHomeScreen()
                }
            } else {
                Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authResult, error in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    // Segue to the home screen
                    self.goToHomeScreen()
                }
            }
        }
    }
    
    @IBAction private func accessoryButtonAction(_ sender: UIButton) {
        self.loginStatus = (self.loginStatus == .signUp) ? .signIn : .signUp
    }
}
