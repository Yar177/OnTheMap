//
//  EndSessionModel.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/12/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation

struct EndSessionModel: Codable {
    
    let session: Logout
    
}

struct Logout: Codable {
    
    let sessionId: String
    let expiration: String
    
    enum CodingKeys: String, CodingKey {
        case sessionId = "id"
        case expiration
        
    }
}
