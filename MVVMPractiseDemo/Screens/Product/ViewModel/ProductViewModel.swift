//
//  ProductViewModel.swift
//  MVVMPractiseDemo
//
//  Created by Amit on 18/02/23.
//

import Foundation

final class ProductViewModel {
    var products: [Product] = []
    var eventHandler: ((_ event : Event) -> Void)? // Data Binding closure
    var eventHandler1: ((_ event : Event) -> Void)?
    var noInternet: (() -> Void)?
    let internetConnectivity =  InternetAvaiable()

    func checkInternetConnectivity(completion: (Bool)->()) {
        completion(internetConnectivity.isInternetAvailable())
    }
    func fetchProducts(){
        eventHandler?(.loading)
        APIManager.shared.request(
            modelType: [Product].self, type: APIEndPoint.products) { response in
                switch response {
                case .success(let products):
                    self.products =  products
                    self.eventHandler?(.stopLoading)
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.stopLoading)
                    self.eventHandler?(.error(error))
                }
            }
    }
}

extension ProductViewModel{
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
