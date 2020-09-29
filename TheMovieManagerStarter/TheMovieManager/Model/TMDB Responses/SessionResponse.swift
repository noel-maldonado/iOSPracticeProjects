//
//  SessionResponse.swift
//  TheMovieManager
//
//  Created by Owen LaRosa on 8/13/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation

struct SessionResponse: Codable {
    let succes: Bool
    let sessionID: String
    
    enum CodingKeys: String, CodingKey {
        case succes
        case sessionID = "session_id"
    }
}

