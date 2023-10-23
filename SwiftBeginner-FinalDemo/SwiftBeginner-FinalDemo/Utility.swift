//
//  Utility.swift
//  SwiftBeginner-FinalDemo
//
//  Created by Shakir Husain on 22/10/23.
//

import UIKit
import Kingfisher

extension UIImageView{
    
    func setImage(urlStr:String)  {
        
        guard let url = URL(string: urlStr) else {
            return
        }
        self.kf.setImage(with: url)
    }
}
