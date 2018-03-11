//
//  APIManager.swift
//  TimBurtons
//
//  Created by Siddhesh Mahadeshwar on 09/03/18.
//  Copyright © 2018 net.siddhesh. All rights reserved.
//

import UIKit

let Schema = "https"
#if DEVELOPMENT
let HOST = "api.timburtonsDev.com"
#elseif QA
let HOST = "api.timburtonsQA.com"
#else
let HOST = "api.timburtons.com"
#endif
let serverURL = Schema+"://"+HOST

let product = "/v1/products"


class APIManager: NSObject {

    static let shared = APIManager()
    private override init() {
        super.init()
    }
    
    func getProducts(completionHandler:([Product]?, Error?) -> Void)
    {
        getRequest(serverURL + product, header: nil, params: nil) { (result, error) in
            
            if let array =  result?["products"] as? [Any]
            {
                 completionHandler(Product.getProducts(from: array), nil)
            }
            else
            {
                completionHandler(nil, error)
            }
        }
    }
   
    private func getRequest(_ urlString: String, header: [String : String]?, params : [String : Any]? = nil, completionHandler: ([String:Any]?, Error?) -> Void) {
        completionHandler(getMockResponse(), nil)
    }
    
    func getMockResponse() -> [String:Any]
    {
        return [
            "products":[["id": 1,"name": "Coffee","size": "small","cost": Float(0.99),"type": "drink"],
                        ["id": 2,"name": "Coffee","size": "medium","cost": Float(1.22),"type": "drink"],
                        ["id": 3,"name": "Coffee","size": "large","cost": Float(1.54),"type": "drink"],
                        ["id": 4,"name": "Lemon Poppy Seed Cake","cost": Float(0.99),"type": "food"],
                        ["id": 5,"name": "banana","cost": Float(0.99),"type": "food"]
            ]
        ]
    }
}
