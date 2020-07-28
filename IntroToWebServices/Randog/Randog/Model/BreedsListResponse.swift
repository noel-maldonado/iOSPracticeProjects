//
//  BreedsListResponse.swift
//  Randog
//
//  Created by Noel Maldonado on 7/27/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import Foundation

struct BreedsListResponse: Codable {
    let status: String
    let message: [String: [String]]
    
    
}
