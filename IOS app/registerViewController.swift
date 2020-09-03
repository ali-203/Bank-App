//
//  registerViewController.swift
//  IOS app
//
//  Created by ALIVA on 7/29/20.
//  Copyright © 2020 ALIVA. All rights reserved.
//

import UIKit
import Firebase



class registerViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        
        
         if let email = emailText.text, let password = passwordText.text {
            
                   Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    
                       if let e = error{
                        
                    
                          print(e)
                            
                     } else {
                           self.performSegue(withIdentifier: "registerToChat", sender: self)
                        }
                    }
                    }

            }
            }

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
