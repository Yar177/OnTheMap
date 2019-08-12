//
//  LoginModel.swift
//  OnTheMap
//
//  Created by Hoshiar Sher on 8/12/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import Foundation

struct LoginModel: Codable {
    
    let udacity: Login
}

struct Login: Codable {
    let username: String
    let password: String
}
