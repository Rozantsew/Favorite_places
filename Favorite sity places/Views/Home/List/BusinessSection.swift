//
//  BusinessSection.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 07/11/2022.
//

import SwiftUI

struct BusinessSection: View {
      
    var title: String
    var businesses: [Business]
    
    var body: some View {
        Section (header: BusinessSectionHeader(title: "Restaurants")) {
            ForEach(businesses) { business in
                
                NavigationLink(destination: BusinessDetail(business: business))  {
                    BusinessRow(business: business)
                }
            }
        }
    }
}
