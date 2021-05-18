//
//  ViewController.swift
//  ecommerce
//
//  Created by Student 08 on 3/27/21.
//  Copyright © 2021 Student 08. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameLoginTextView: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
         if(segue.identifier == "signUp"){
            if segue.destination is SignUpViewController{
                   
               }
            }
        
        if(segue.identifier == "loginHome"){
           if let loginHome = segue.destination as? HomeViewController{
           loginHome.incomingSignUpUsername = usernameLoginTextView.text ?? "";

              }
           }

 }
    
    


}

