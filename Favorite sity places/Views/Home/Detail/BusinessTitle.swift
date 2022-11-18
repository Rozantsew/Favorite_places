//
//  BusinessTitle.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 18/11/2022.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        VStack (alignment: .leading) {
            // Business Name
            Text(business.name!)
                .font(.largeTitle)
            // Loop through display address
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                }
            }
            

                // Rating
                VStack (alignment: .leading) {
                    Image("regular_\(business.rating ?? 0)")
                }
        }
        .padding()
    }
}

