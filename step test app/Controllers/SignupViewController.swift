//
//  SignupViewController.swift
//  step test app
//
//  Created by Francis on 7/1/20.
//  Copyright © 2020 Lidong Zhuo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements(){
        
        // Hide error label
        errorLabel.alpha = 0
        
    
    }
    
    func validateFields() -> String?{
        
        //Check all fields are filled in
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "", lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "",
            usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "",
            emailTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "",
            passwordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill in all fields."
        }
        
        //Check password
        let cleanedPassword = passwordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password matches the requirements."
        }

        return nil
    }
    
    
    
    @IBAction func signupPressed(_ sender: UIButton) {
        
        //Validate the fields
        let error = validateFields()
        
        if error != nil{
            
            showError(error!)
        } else {
            
            //create data
            
            let firstname = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                //check errors
                if err != nil{
                    
                    self.showError("Error creating user")
                    
                } else {
                    
                    //store info
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstname, "lastname":lastname, "username": username, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil{
                            self.showError("User info error")
                        }
                    }
                    
                    //Transition to the garden screen
                    self.transitionToGarden()
                    
                    
                }
            }
        }
    }
    
    func showError(_ message:String){
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
        
    func transitionToGarden(){
        
        let gardenViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.gardenViewController) as? GardenViewController
        
        view.window?.rootViewController = gardenViewController
        view.window?.makeKeyAndVisible()
    }
    
    
}
