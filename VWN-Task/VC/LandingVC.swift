//
//  ViewController.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/2/22.
//

import UIKit

class LandingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtn(_ sender: Any) {
        navigate(screenID: "log_in")
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
    }
}

