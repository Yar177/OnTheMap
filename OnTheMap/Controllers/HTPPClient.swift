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
    
//    struct Auth {
//        static var accountId = 0
//        static var requestToken = ""
//        static var sessionId = ""
//    }
    
    struct Auth {
        static var keyAccount = ""
        static var sessionId = ""
    }
    
    enum Endpoints {
        static let base = "https://onthemap-api.udacity.com/v1/"
        
        case starthSession
        case getStudentsLocation
        case addNewLocation
        case updateLocation (String)
        case getUserInfo
        case logout
        
        var urlBody: String {
            switch self {
            case .starthSession: return Endpoints.base + "session"
            case .getStudentsLocation: return Endpoints.base + "StudentLocation?order=-updatedAt&limit=100"
            case .addNewLocation: return Endpoints.base + "StudentLocation"
            case .updateLocation(let objectID): return Endpoints.base + "StudentLocation/\(objectID)"
            case .getUserInfo: return Endpoints.base + "users/" + Auth.keyAccount
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
                return }
            let decoder = JSONDecoder()
            do {
                let requestObject = try decoder.decode(ResultsModel.self, from: data)
                DispatchQueue.main.async {
                    completionHandeler(requestObject.results, nil)
                } } catch {
                DispatchQueue.main.async {
                    completionHandeler([], error)
                    print("error 2")
                    print(error)
                }} }
        task.resume()
    }
    
    
    class func startSession(username: String, password: String, completion: @escaping(Bool, Error?) -> Void){
        
        var request = URLRequest(url: Endpoints.starthSession.url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let requestBody = LoginModel(udacity: Login(username: username, password: password))
        request.httpBody = try! JSONEncoder().encode(requestBody)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{
                DispatchQueue.main.async {
                    return completion(false, error)
                }
                return
            }
            
            let acutalData = data.subdata(in: 5..<data.count)
            let deconder = JSONDecoder()
            do{
                let responseObject = try deconder.decode(LoginResponseModel.self, from: acutalData)
                DispatchQueue.main.async {
                    self.Auth.sessionId = responseObject.session.id
                    self.Auth.keyAccount = responseObject.account.key
                    completion(true, nil)
                }
            }
            catch{
                DispatchQueue.main.async {
                    completion(false, error)
                }
            }
        }
        task.resume()
    }
    
    
    
    
    
    
    
    
    
}
