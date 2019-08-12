//
//  UpdatedLocationResponse.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/12/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation

struct UpdatedLocationResponse: Codable {
    
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case updatedAt
    }
}

