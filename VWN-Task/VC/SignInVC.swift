//
//  SignInVC.swift
//  VWN-Task
//
//  Created by Micheal Hany on 8/2/22.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var signInBtn: UIButton!
    
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initHideKeyboard()  // make a tap guesture on the free space to cancele input
        
        updateSignInBtnShadow()

    }
    
    
    @IBAction func signInBtn(_ sender: Any) {
        
        signInValidate(usernameTxt.text!, passwordTxt.text!)
        
    }
    
    func signInValidate(_ username:String,_ password:String){
        if(username == "michealH21" && password == "123456789"){
            navigate(screenID: "options")
        }else{
            let error = "Invalid Email or Password"
            self.worngAuthAlert(error)
        }
        
    }
    
    func updateSignInBtnShadow(){
        
        signInBtn.layer.shadowColor = UIColor(red: 229/255, green: 79/255, blue: 79/255, alpha: 0.30).cgColor
        signInBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        signInBtn.layer.shadowOpacity = 1.0
        signInBtn.layer.shadowRadius = 60.0
        
    }
    
}
