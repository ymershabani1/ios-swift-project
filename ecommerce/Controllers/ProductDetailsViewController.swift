//
//  ProductDetailsViewController.swift
//  ecommerce
//
//  Created by Baton Ferri on 3/29/21.
//  Copyright © 2021 Student 08. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var productImageDetails: UIImageView!
    @IBOutlet weak var productNameDetails: UILabel!
    @IBOutlet weak var productTypeDetails: UILabel!
    @IBOutlet weak var productPriceDetails: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var incomingUsername: String = "";
    
    var productObj: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = incomingUsername;
        productImageDetails.image = UIImage(named: productObj?.productImg ?? "");
        productNameDetails.text = productObj?.productName;
        productTypeDetails.text = productObj?.productType;
        productPriceDetails.text = productObj?.productPrice;
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
         if(segue.identifier == "buySeg"){
            if segue.destination is WebViewController{
                   
               }
            }
        if(segue.identifier == "perNeSeg"){
           if segue.destination is PerNeViewController{
                  
              }
           }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
