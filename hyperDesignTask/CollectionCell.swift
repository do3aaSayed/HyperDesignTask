//
//  collectionCell.swift
//  hyperDesignTask
//
//  Created by Doaa on 1/17/18.
//  Copyright © 2018 Doaa. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import PinterestLayout

class collectionCell : UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    @IBOutlet weak var productImageHeightConstraint: NSLayoutConstraint!


    
    
    var image: UIImage? {
        didSet {
            if let image = image {
                
                productImage.image = image
            } else {
                productImage.backgroundColor = .lightGray
            }
        }
    }
    
    
    func updateCell(receivedProduct : product){
        
        productDescription.text = receivedProduct.productDescription
        
        productPrice.text = "\(receivedProduct.price!)"
        
        //downloadProductImage(imageUrl: receivedProduct.imageInfo.url!)
        productImage.af_setImage(withURL: URL(string:receivedProduct.imageInfo.url!)!)
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            productImageHeightConstraint.constant = attributes.imageHeight
        }
    }
    
    func downloadProductImage(imageUrl : String){
        
        Alamofire.request(imageUrl).responseImage { (response) in
            if let image = response.result.value {
                self.productImage.image = image
            }
        }
        
    }
    
    
}
