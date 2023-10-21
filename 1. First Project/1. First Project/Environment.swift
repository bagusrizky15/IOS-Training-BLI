//
//  Environment.swift
//  1. First Project
//
//  Created by BBPDEV on 20/10/23.
//

import Foundation

public enum Environment {
    enum Keys {
        static let productName = "PRODUCT_NAME"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Error")
        }
        return dict
    }()
    
    static let productNameString: String = {
        guard let prodName = Environment.infoDictionary[Keys.productName] as? String else {
            fatalError("Error Product Name")
        }
        return prodName
    }()
}
