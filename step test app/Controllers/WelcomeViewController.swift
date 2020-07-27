//
//  WelcomeViewController.swift
//  step test app
//
//  Created by Francis on 7/1/20.
//  Copyright © 2020 Lidong Zhuo. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "STEPEEN"
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval:0.1 * charIndex, repeats: false){(timer) in self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }

    }
    
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if segue.identifier == "goToLogin" {
            //let destinationVC = segue.destination
       // }
    //}

}
