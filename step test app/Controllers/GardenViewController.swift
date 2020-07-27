//
//  ViewController.swift
//  step test app
//
//  Created by Francis on 6/19/20.
//  Copyright © 2020 Lidong Zhuo. All rights reserved.
//


import UIKit
import CoreMotion

class GardenViewController: UIViewController{
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var profileButton: UIButton!
    
    let pedometer = CMPedometer()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        startPedometerUpdates()
    }
    
    func startPedometerUpdates(){
        guard CMPedometer.isStepCountingAvailable() else{
            self.textView.text = "66666"
            return
        }
    
        let cal = Calendar.current
        var comps = cal.dateComponents([.year, .month, .day],from: Date())
        comps.hour = 0
        comps.minute = 0
        comps.second = 0
        let midnightofToday = cal.date(from: comps)!
        
        self.pedometer.startUpdates(from: midnightofToday, withHandler:{pedometerData, error in
            guard error == nil else {
                print(error!)
                return
            }
            var text = ""
            if let numberOfSteps = pedometerData?.numberOfSteps{
                text += "\(numberOfSteps)"
            }
            
            DispatchQueue.main.async{
                self.textView.text = text
            }
        })
    }
    

}

