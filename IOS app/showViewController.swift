//
//  showViewController.swift
//  IOS app
//
//  Created by ALIVA on 7/29/20.
//  Copyright © 2020 ALIVA. All rights reserved.
//

import UIKit
import Firebase

class showViewController: UIViewController {
    
    
    @IBOutlet weak var labelValue: UILabel!
 
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title =  "BANK APP"
        
        navigationItem.hidesBackButton = true
        
        loadAmount()
        
         
    }
    
    func loadAmount() {
        
        let userId = FirebaseAuth.Auth.auth().currentUser?.uid
               let myId: String = userId!


           db.collection("user").document(myId).getDocument { (document, error) in
               if let document = document, document.exists {
                   if let myData = document.data(){
                       let wrappedValue = myData["amount"]
                       let unwrappedValue = wrappedValue
                       self.labelValue.text = "\(unwrappedValue!)"
                   }
               } else {
                   print("Document does not exist")
               }
           }
        
    }
    
 
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
     do {
      try Auth.auth().signOut()
        
        navigationController?.popToRootViewController(animated: true)
        
    } catch let signOutError as NSError {
        
      print ("Error signing out: %@", signOutError)
    }
}
    @IBAction func debitText(_ sender: UIButton) {
        
       
    
        
               var textField = UITextField()
               
               let alert = UIAlertController(title: "Add Your Amount", message: "", preferredStyle: .alert)
               
               let action = UIAlertAction(title: "Add", style: .default) { (action) in
                   //what will happemd when the user click the button≈
                   
                   // Getting values
                   let oldValue : String? = self.labelValue.text
                   
                   let newValue : String? = textField.text!
                   
                   var oldValueIntGlobal = 0
                   
                   var newValueIntGlobal = 0
                   
                   if let string : String = oldValue, let oldValueInt = Int(string){
                       oldValueIntGlobal = oldValueInt
                   }
                   
                   if let stringTwo = newValue, let newValueInt = Int(stringTwo){
                       newValueIntGlobal = newValueInt
                   }
                   

                   let updatedValue = oldValueIntGlobal + newValueIntGlobal
                   self.labelValue.text = "\(updatedValue)"
                
               }
               
               alert.addTextField { (alertTextField) in
                   alertTextField.placeholder = "Amount"
                   textField = alertTextField
               }
             
               alert.addAction(action)
               
               present(alert, animated: true, completion: nil)
    }
    
    @IBAction func creditText(_ sender: UIButton) {
    
       var textField = UITextField()
               
               let alert = UIAlertController(title: "Add Your Amount", message: "", preferredStyle: .alert)
               
               let action = UIAlertAction(title: "Add", style: .default) { (action) in
                   //what will happemd when the user click the button≈
                   
                   // Getting values
                   let oldValue : String? = self.labelValue.text
                   
                   let newValue : String? = textField.text!
                   
                   var oldValueIntGlobal = 0
                   
                   var newValueIntGlobal = 0
                
                
                   if let string : String = oldValue, let oldValueInt = Int(string){
                       oldValueIntGlobal = oldValueInt
                   }
                   
                   if let stringTwo = newValue, let newValueInt = Int(stringTwo){
                       newValueIntGlobal = newValueInt
                   }
               
                   let updatedValue = oldValueIntGlobal - newValueIntGlobal
                
                   self.labelValue.text = "\(updatedValue)"
                
                if oldValueIntGlobal != newValueIntGlobal, updatedValue > 0, let amountSender = Auth.auth().currentUser?.email {
                                                           
        let userId = Auth.auth().currentUser?.uid ?? "anonymous"
                                                           
                                                           
                self.db.collection("user").document(userId).setData([
                    
                    "userEmail": amountSender,
                    
                  "amount": updatedValue
                    
                    ]) { (error) in
                        
                if let e = error {
                    
                print("There was an issue saving data to firestore, \(e)")
                    
                } else {
                    
                    print("Successfully saved data", updatedValue)
                    
                        }
                        
                }
                        }
                                  
        
               }
        
      
               
               
               alert.addTextField { (alertTextField) in
                   alertTextField.placeholder = "Amount"
                   textField = alertTextField
               }
               
               alert.addAction(action)
               
               present(alert, animated: true, completion: nil)
               
       }
   
       
}

        
        
        
        
        
        
        
        
        
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    


