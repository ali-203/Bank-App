//
//  logInViewController.swift
//  IOS app
//
//  Created by ALIVA on 7/29/20.
//  Copyright © 2020 ALIVA. All rights reserved.
//

import UIKit
import Firebase


class logInViewController: UIViewController {
    
    @IBOutlet weak var emailAddress: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        
        
        if let email = emailAddress.text, let password = passwordText.text {
                    
              Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                            
                if let e = error {
                
                    print(e)
                    
                } else {
                   self.performSegue(withIdentifier: "loginToChat", sender: self)
                }
                
            }
                }

            }
        

}
        
        
        
        
        
        
        
        
        
        
      
