//
//  productTblViewCell.swift
//  SwiftBeginner-FinalDemo
//
//  Created by Shakir Husain on 22/10/23.
//

import UIKit

class ProductTblViewCell: UITableViewCell {

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnBuy: UIButton!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgViewProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnBuy.layer.cornerRadius = 10
        btnBuy.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateUI(product:SDMProduct) {
        
        if let value = product.title{
            lblTitle.text = value
        }
        if let value = product.category{
            lblCategory.text = value
        }
        if let value = product.description{
            lblDesc.text = value
        }
        if let value = product.price{
            lblPrice.text  = "$\(value)"
        }
        if let value = product.image{
            imgViewProduct.setImage(urlStr: value)
        }


    }
}
