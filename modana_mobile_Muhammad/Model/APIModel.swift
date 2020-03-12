//
//  APIModel.swift
//  modana_mobile_Muhammad
//
//  Created by Muhammad Reynaldi on 12/03/20.
//  Copyright © 2020 -. All rights reserved.
//

import Foundation

struct Publics:Decodable {
    var entries:[Public]
}

struct Public:Decodable {
    var Description:String
    var Link:String
    var Category:String
}
