//
//  LoginViewController.swift
//  lab-insta-parse
//
//  Created by Charlie Hieger on 10/29/22.
//

import UIKit
import Firebase

// TODO: Pt 1 - Import Parse Swift


class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLoginTapped(_ sender: Any) {
        guard let username = usernameField.text,
              let password = passwordField.text else {
            print("Username or password is nil!")
            return
        }
        
        Firebase.Auth.auth().signIn(withEmail: username, password: password){ result, error in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            guard let result else {
                print("Error occured while logging in.")
                return
            }
            
            print("Signed In")
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
        
            
            
            // Make sure all fields are non-nil and non-empty.
            //        guard let username = usernameField.text,
            //              let password = passwordField.text,
            //              !username.isEmpty,
            //              !password.isEmpty else {
            //
            //            showMissingFieldsAlert()
            //            return
            //        }
            
            // TODO: Pt 1 - Log in the parse user
            
        }
        
//        private func showAlert(description: String?) {
//            let alertController = UIAlertController(title: "Unable to Log in", message: description ?? "Unknown error", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .default)
//            alertController.addAction(action)
//            present(alertController, animated: true)
//        }
//
//        private func showMissingFieldsAlert() {
//            let alertController = UIAlertController(title: "Opps...", message: "We need all fields filled out in order to log you in.", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .default)
//            alertController.addAction(action)
//            present(alertController, animated: true)
//        }
}
    

