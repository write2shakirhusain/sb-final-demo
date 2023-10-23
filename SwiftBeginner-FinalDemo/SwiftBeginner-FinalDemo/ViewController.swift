//
//  ViewController.swift
//  SwiftBeginner-FinalDemo
//
//  Created by Shakir Husain on 21/10/23.
//

import UIKit

class ViewController: UIViewController,APIDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var tblViewProduct: UITableView!
    

    var apiService:APIService?
    var productlist:[SDMProduct] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblViewProduct.dataSource = self
        apiService = APIService(delegate: self)
        apiService?.fetchProducts(urlStr: "https://fakestoreapi.com/products")
        
    }
    
    //MARK: APIService Delegate
    func didGetProducts(products: Any) {
        
        guard let list = products as? [Any] else {
            return
        }
        
        for item in list {
            
            var product = SDMProduct()
            
            guard let aDict = item as? [String:Any] else {
                return
            }
            if let value = aDict["id"] as? Int{
                product.id = value
            }
            if let value = aDict["price"] as? Double{
                product.price = value
            }
            if let value = aDict["title"] as? String{
                product.title = value
            }
            if let value = aDict["category"] as? String{
                product.category = value
            }
            if let value = aDict["description"] as? String{
                product.description = value
            }
            if let value = aDict["image"] as? String{
                product.image = value
            }
            productlist.append(product)
            
            
        }
        tblViewProduct.reloadData()
        print(productlist)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tblViewProduct.dequeueReusableCell(withIdentifier: "ProductTblViewCell") as? ProductTblViewCell else {
            return UITableViewCell()
        }
        cell.updateUI(product: productlist[indexPath.row])
        
        return cell
        
    }
    
    
}

