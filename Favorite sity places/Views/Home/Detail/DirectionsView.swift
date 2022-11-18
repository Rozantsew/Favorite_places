//
//  DirectionsView.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 18/11/2022.
//

import SwiftUI

struct DirectionsView: View {
    
    var business: Business
    
    var body: some View {
        
        HStack (alignment: .top) {
            
            // Business title
            BusinessTitle(business: business)
            Spacer()
            
            if let lat = business.coordinates?.latitude,
               let long = business.coordinates?.longitude,
               let name = business.name {
                
                Link("Open in Maps", destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!)
                    .padding()
            }
        }
        // Direction map
        DirectionsMap(business: business)
            .ignoresSafeArea(.all, edges: .bottom)
    }   
}
