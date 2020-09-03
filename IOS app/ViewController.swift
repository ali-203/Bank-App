//
//  ViewController.swift
//  IOS app
//
//  Created by ALIVA on 7/29/20.
//  Copyright © 2020 ALIVA. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var titleText: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleText.text = ""
        var charIndex = 0.0
        let titleText = "BANK APP"
        for letter in titleText {
            
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex,
                      repeats: false) { (timer) in
                                 
                self.titleText.text?.append(letter)
        }
        
        charIndex += 1
        
        
        
    }


}

}
