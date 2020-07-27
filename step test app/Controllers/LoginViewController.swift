//
//  LoginViewController.swift
//  step test app
//
//  Created by Francis on 7/1/20.
//  Copyright © 2020 Lidong Zhuo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            setUpElements()
        
    }

  
    
    func setUpElements(){
        errorLabel.alpha = 0
    }
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        
        
        // create cleaned text
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
    

        if email == emailTextField.text! && password == passwordTextField.text!{
        UserDefaults.standard.set(emailTextField.text!, forKey: "email")
        let gardenViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.gardenViewController) as? GardenViewController

        self.view.window?.rootViewController = gardenViewController
        self.view.window?.makeKeyAndVisible()
        
        }
        
        // login
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil{
                self.errorLabel.text = "Wrong email or password"
                self.errorLabel.alpha = 1
            } else {
                 let gardenViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.gardenViewController) as? GardenViewController

                       self.view.window?.rootViewController = gardenViewController
                       self.view.window?.makeKeyAndVisible()
            }
        }
        
        
        
        
    }
    
    
    

}

