//
//  Product.swift
//  TimBurtons
//
//  Created by Siddhesh Mahadeshwar on 09/03/18.
//  Copyright © 2018 net.siddhesh. All rights reserved.
//

import UIKit

struct Product {

    var id:Int?
    var name:String?
    var cost:Float?
    var type:String?
    
    private init(dictionary: [String:Any])
    {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        cost = dictionary["cost"] as? Float
        type = dictionary["type"] as? String
    }
    
    static func getProducts(from array:[Any]?) ->[Product]?
    {
        var products =  [Product]()
        if let array = array
        {
            for dictionary in array
            {
                if let dictionary = dictionary as? [String:Any]
                {
                    products.append(Product(dictionary: dictionary))
                }
            }
        }
        return products
    }
}
