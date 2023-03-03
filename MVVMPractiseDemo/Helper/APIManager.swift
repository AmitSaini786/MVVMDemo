//
//  APIManager.swift
//  MVVMPractiseDemo
//
//  Created by Amit on 18/02/23.
//

import Foundation

//----Using singleton design pattern in this----//

enum DataError : Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

// created typealias here to reduce the effort to write the same code
typealias Handler<T> = (Result <T, DataError>) -> Void

///final keyword is used to restrict the inheritance
///no child class can inherit the APIManager manager class
///private init is used to restrict to create the instance of APIManager class

final class APIManager{
    
    static let shared = APIManager()
    
    private init() {}
    
    ///here we are creating generic function which takes any model type
    ///same request function will work for both GET/POST
    func request<T: Codable>(
        modelType : T.Type,
        type: EndPointType,
        complition: @escaping Handler<T>
    ){
        // control will return from here if we pass a invalid url
        ///it will prevents the app for crashing
        
        guard let url = type.url else{
            complition(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 30
        request.httpMethod = type.methods.rawValue
        
        if let parameters = type.body{
            request.httpBody = try? JSONEncoder().encode(parameters)
        }
        
        request.allHTTPHeaderFields = type.headers
        
        //Background task
        ///URLSession Iis the small s singelton becasue we can use it by using creating the instance or without creating any instance
        

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, error == nil else{
                complition(.failure(.invalidData))
                return
            }
            
            /// here we can the status code of api id range in between 200 to 299
            /// if range is not inbetween the numbers then it will returns from here otherwise continue to line
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else{
                complition(.failure(.network(error)))
                return
            }
            
            // JSONDecoder() will convert data to model
            
            do{
                let result  = try JSONDecoder().decode(modelType, from: data)
                complition(.success(result))
            }catch{
                complition(.failure(.network(error)))
            }
            ///here we use resume because dataTask will execte async(backgroud)
            ///resume create's  memory for async task and return the control on complition of task
        }.resume()
        
    }
    
    ///add all the headers here
    ///ask backend team to provide all the headers and add all headers in the dictionary separated by ,
    static var commonHeaders: [String:String]{
        return[
            "Content-Type": "application/json"
        ]
    }
}
