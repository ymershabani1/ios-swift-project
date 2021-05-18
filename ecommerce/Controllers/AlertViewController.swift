//
//  AlertViewController.swift
//  ecommerce
//
//  Created by Baton Ferri on 5/17/21.
//  Copyright © 2021 Student 08. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    var tvfName = UITextField()
    var tvlName = UITextField()
    var label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextFields()
        addTapGestureRecognizer()
        
    }
    
    
    func addTextFields(){
        
        label.frame = CGRect(x: 10, y: 120, width: self.view.frame.width - 10, height: 15)
        label.text = "Enter Your Full Name On Fields Below"
        self.view.addSubview(label)
        
        tvfName.frame = CGRect(x: 10, y: 170, width: self.view.frame.width-20, height: 40)
        tvfName.placeholder = "First Name"
        self.view.addSubview(tvfName)
        
        tvlName.frame = CGRect(x: 10, y: 220, width: self.view.frame.width-20, height: 40)
        tvlName.placeholder = "Last Name"
        self.view.addSubview(tvlName)
    }
    
    func addTapGestureRecognizer(){
           let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
           self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        let alert = UIAlertController(title: "\(String(describing: tvfName.text ?? ""))", message:"\(String(describing: tvlName.text ?? ""))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
      }
}
