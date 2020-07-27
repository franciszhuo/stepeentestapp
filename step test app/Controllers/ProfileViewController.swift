//
//  ProfileViewController.swift
//  step test app
//
//  Created by Francis on 7/8/20.
//  Copyright © 2020 Lidong Zhuo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class ProfileViewController: UIViewController {


    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var usernameLabel: UITextView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    @IBAction func logoutPressed(_ sender: Any) {
        do{
             try Auth.auth().signOut()
        } catch let logoutError{
            print(logoutError)
        }
        
        let loginViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? LoginViewController
        
        self.view.window?.rootViewController = loginViewController
        self.view.window?.makeKeyAndVisible()
        
    }
    

    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        
        let gardenViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.gardenViewController) as? GardenViewController

        self.view.window?.rootViewController = gardenViewController
        self.view.window?.makeKeyAndVisible()
        
    }
    

}
