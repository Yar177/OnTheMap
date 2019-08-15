//
//  NewLocationResponse.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/15/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation

struct NewLocationResponse: Codable {
    let createdAt: String
    let objectId: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt
        case objectId
    }
}
