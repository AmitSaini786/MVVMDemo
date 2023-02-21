//
//  EndPointType.swift
//  MVVMPractiseDemo
//
//  Created by Amit on 18/02/23.
//

///It is helper to call the api like to pass parameters
///type of API like get and post
///base url of api and path
///to pass headers
import Foundation

enum HTTPMethods: String{
    case get = "GET"
    case post = "POST"
}

protocol EndPointType{
    var path :String {get}
    var baseURL : String {get}
    var url : URL? {get}
    var methods : HTTPMethods{get}
    var body : Encodable? {get}
    var headers : [String : String]? {get}
}
