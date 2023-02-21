//
//  APIEndPoint.swift
//  MVVMPractiseDemo
//
//  Created by Amit on 18/02/23.
//

import Foundation

enum APIEndPoint{
    case products // Module - GET
}

// https://fakestoreapi.com/products
extension APIEndPoint : EndPointType{
    var path: String {
        switch self{
        case .products:
            return "products"
        }
    }
    
    var baseURL: String {
        switch self{
        case .products:
            return "https://fakestoreapi.com/"
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var methods: HTTPMethods {
        switch self{
        case .products:
            return.get
        }
    }
    
    var body: Encodable? {
        switch self{
        case .products:
            return nil
        }
    }
    
    var headers: [String : String]? {
        APIManager.commonHeaders
    }
    
    
}
