//
//  BusinessSearch.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 04/11/2022.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}

    
