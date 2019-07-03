//
//  NetworkRequest.swift
//  AlamofireDemo
//
//  Created by iWizards XI on 03/07/19.
//  Copyright © 2019 iWizards XI. All rights reserved.
//

import Foundation
import Alamofire

class NetworkRequest{
    
    typealias webServiceResponse = ([[String:Any]]?, Error?) -> Void
//    func executeURL (_ url: URL, completion: @escaping ([[String:Any]]?, Error?) -> Void){
    func executeURL (_ url: URL, completion:@escaping webServiceResponse) {
        
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//        Alamofire.request(urlRequest)
        
        Alamofire.request(url).validate().responseJSON { response in
            if let error = response.error{
                completion(nil, error)
            }else if let jsonArray = response.result.value as? [[String : Any]]{
                completion(jsonArray, nil)
            }else if let jsonDict = response.result.value as? [String: Any]{
                completion([jsonDict], nil)
            }
        }
        
    }
    
}
