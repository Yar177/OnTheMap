//
//  Results.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/8/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation


struct ResultsModel: Codable {
    
    let results: [StudentLocationModel]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
