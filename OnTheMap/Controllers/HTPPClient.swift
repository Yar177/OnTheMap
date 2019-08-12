//
//  HTPPClient.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/8/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation




class HTTPClient {
    static let apiKey = "bdddad458636a0f190525a289c764e96"
    
    struct Auth {
        static var accountId = 0
        static var requestToken = ""
        static var sessionId = ""
    }
    
    enum Endpoints {
        static let base = "https://onthemap-api.udacity.com/v1/"
        
        case establishSession
        case getStudentsLocation
        case postStudentLocation
        case updateStudentLocation (String)
        case getUserData
        case logout
        
        var urlBody: String {
            switch self {
            case .establishSession: return Endpoints.base + "session"
            case .getStudentsLocation: return Endpoints.base + "StudentLocation?order=-updatedAt&limit=100"
            case .postStudentLocation: return Endpoints.base + "StudentLocation"
            case .updateStudentLocation(let objectID): return Endpoints.base + "StudentLocation/\(objectID)"
            case .getUserData: return Endpoints.base + "users/" + Auth.requestToken
            case .logout: return Endpoints.base + "session"
            }
        }
        
        var url: URL {
            return URL(string: urlBody)!
        }
    }

    
    
    class func getStudentsLocation(completionHandeler: @escaping ([StudentLocationModel]?, Error?)-> Void){
        let task = URLSession.shared.dataTask(with: Endpoints.getStudentsLocation.url){ (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandeler([], error)
                  
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let requestObject = try decoder.decode(ResultsModel.self, from: data)
                DispatchQueue.main.async {
                    completionHandeler(requestObject.results, nil)
                    
                }
            }catch {
                DispatchQueue.main.async {
                    completionHandeler([], error)
                    print("error 2")
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    
    
    
    
    
    
}
