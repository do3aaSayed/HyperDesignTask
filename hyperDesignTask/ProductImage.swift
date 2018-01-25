//
//  ProductImage.swift
//  hyperDesignTask
//
//  Created by Doaa on 1/23/18.
//  Copyright © 2018 Doaa. All rights reserved.
//

import Foundation
import ObjectMapper

class productImage : Mappable {
    
    var height : Int!
    var width : Int!
    var url : String!
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        url                <- map["url"]
        height             <- map["height"]
        width              <- map["width"]
      
    }

    
}
