//
//  YelpAttribution.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 21/11/2022.
//

import SwiftUI

struct YelpAttribution: View {
    
    var link: String
    
    var body: some View {
        Link(destination: URL(string: link)!) {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 36 )
        }
    }
}
