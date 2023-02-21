//
//  CheckNetworkConnectivity.swift
//  MVVMDemo
//
//  Created by Amit on 18/02/23.
//

import Foundation
import Reachability

struct InternetAvaiable{

    func isInternetAvailable() -> Bool{
        var returnValue: Bool = false

        NetworkManager.isUnreachable { _ in
            returnValue = false
        }
        NetworkManager.isReachable{ _ in
            returnValue = true
        }

        return returnValue
    }
}
