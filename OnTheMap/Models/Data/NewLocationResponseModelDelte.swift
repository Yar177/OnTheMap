//
//  NewLocationResponseModel.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/12/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation

struct NewLocationResponseModelDelte: Codable {
    let createdAt: String
    let objectId: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt
        case objectId
    }
}
