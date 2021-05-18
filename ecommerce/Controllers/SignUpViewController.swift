//
//  SignUpViewController.swift
//  ecommerce
//
//  Created by Student 08 on 3/27/21.
//  Copyright © 2021 Student 08. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {


    @IBOutlet weak var signUpUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
         if(segue.identifier == "home"){
            if let home = segue.destination as? HomeViewController{
                home.incomingSignUpUsername = signUpUsername.text ?? "";
               }
            }
        
    }
    
}
