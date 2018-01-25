//
//  product.swift
//  hyperDesignTask
//
//  Created by Doaa on 1/17/18.
//  Copyright © 2018 Doaa. All rights reserved.
//

import Foundation
import ObjectMapper

class product : Mappable {
    
    var productId : Int!
    var productDescription : String!
    var price : Int!
    var imageInfo = productImage()
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        productId          <- map["id"]
        productDescription <- map["productDescription"]
        price              <- map["price"]
        imageInfo          <- map["image"]
        
    }
    
    
    
}
