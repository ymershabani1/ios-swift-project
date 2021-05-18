//
//  HomeViewController.swift
//  ecommerce
//
//  Created by Student 08 on 3/27/21.
//  Copyright © 2021 Student 08. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var products: [Product] = [];
    

    
    @IBOutlet weak var productTable: UITableView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    var incomingSignUpUsername: String = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = incomingSignUpUsername;
        setupProductsTable();
        createProducts();
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
         if(segue.identifier == "pdUiView"){
            if segue.destination is ProductDetailsViewController{
                   
               }
            }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count;
    }
    
    func setupProductsTable(){
        productTable.dataSource = self
        productTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell");
        
          if let productImgView = cell?.viewWithTag(1) as? UIImageView{
              productImgView.image = UIImage(named: products[indexPath.row].productImg ?? "")
            
          }
          
          if let productName = cell?.viewWithTag(2) as? UILabel{
              productName.text = products[indexPath.row].productName
                }
          
          if let productType = cell?.viewWithTag(3) as? UILabel{
              productType.text = products[indexPath.row].productType
            
         }
        
          if let productPrice = cell?.viewWithTag(4) as? UILabel{
            productPrice.text = products[indexPath.row].productPrice
                }
          
          return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let productDetailsVC = storyboard.instantiateViewController(identifier: "productDetails") as! ProductDetailsViewController
        productDetailsVC.productObj = products[indexPath.row]
        productDetailsVC.incomingUsername = usernameLabel.text ?? ""
        
        
        self.navigationController?.pushViewController(productDetailsVC, animated: true)
    }
    
    func createProducts(){
        var product = Product()
        product.productName = "Uncut Gems"
        product.productType = "T-shirt"
        product.productImg = "uncut-gems"
        product.productPrice = "$30"
        
        products.append(product)
        
        product.productName = "Pulp Fiction"
        product.productType = "T-shirt"
        product.productImg = "purpf"
        product.productPrice = "$30"
        
        products.append(product)
        
        
        product.productName = "Shining"
        product.productType = "T-shirt"
        product.productImg = "shining"
        product.productPrice = "$30"
        
        products.append(product)
        
        
        
        product.productName = "Vans"
        product.productType = "Hoodie"
        product.productImg = "orange-hoodie-vans"
        product.productPrice = "$95"
        
        products.append(product)
        
        product.productName = "Purple Hova"
        product.productType = "Hoodie"
        product.productImg = "purple-hoodie"
        product.productPrice = "$80"
        
        products.append(product)
        
        product.productName = "Cat"
        product.productType = "Sweatshirt"
        product.productImg = "sweatshirt"
        product.productPrice = "$60"
        
        products.append(product)
        
        
        
      
        productTable.reloadData()
    }
    
    private func headerView() -> UIView{
           let header = UIView(frame: CGRect(x: 0, y: 0, width: self.productTable.frame.width, height: 50))
               header.backgroundColor = UIColor(named: "header")
        
              return header
        
    }

    func footerView() -> UIView{
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: self.productTable.frame.width, height: 50))
            footer.backgroundColor = UIColor(named: "footer")
        
            return footer
        }
    
    

}
