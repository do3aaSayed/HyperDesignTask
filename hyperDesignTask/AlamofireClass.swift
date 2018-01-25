//
//  AlamofireClass.swift
//  hyperDesignTask
//
//  Created by Doaa on 1/17/18.
//  Copyright © 2018 Doaa. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class AlamofireRequest {
    
    var baseUrl = "http://grapesnberries.getsandbox.com/products?"
    var countString = "count="
    var fromString = "&from="
    
    
    func productsRequest(count : Int , from productIdToGetFrom : Int , setProducts: @escaping (_ products : [product])->())->(){
        
        Alamofire.request("\(baseUrl)\(countString)\(count)\(fromString)\(productIdToGetFrom)").responseJSON { response in
            
            if let json = response.result.value {
                let products = Mapper<product>().mapArray(JSONArray: json as! [[String : Any]])
                
                setProducts(products)
            }
            
        }
        
    }

    
}
