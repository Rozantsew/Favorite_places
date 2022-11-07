//
//  BusinessSectionHeader.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 07/11/2022.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String 
    
    var body: some View {
        ZStack (alignment: .leading ) {
            Rectangle()
                .foregroundColor(.white)
            Text(title)
                .font(.headline)
        }
    }
}

struct BusinessSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "Restaurants")
    }
}
