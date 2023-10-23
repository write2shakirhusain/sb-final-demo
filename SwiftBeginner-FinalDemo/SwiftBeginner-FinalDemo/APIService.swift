//
//  APIService.swift
//  SwiftBeginner-FinalDemo
//
//  Created by Shakir Husain on 22/10/23.
//

import Foundation

protocol APIDelegate {
    func didGetProducts(products:Any)
}

class APIService{
    
    var delegate:APIDelegate
    
    init(delegate: APIDelegate) {
        self.delegate = delegate
    }
    
    func fetchProducts(urlStr:String) {
        guard let url = URL(string: urlStr) else {
            print("URL is not supported!")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            guard let response = urlResponse as? HTTPURLResponse,response.statusCode == 200 && data != nil && error == nil else {
                print("something went wrong")
                return
            }
            
            if let jsonObject = try?JSONSerialization.jsonObject(with: data!) {
                
                DispatchQueue.main.async {
                    self.delegate.didGetProducts(products: jsonObject)
                }
                
            }else{
                print("Data is invalid!")
            }
            
        }
        task.resume()
        
        
    }
    
    
}
