//
//  BusinessList.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 07/11/2022.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]) {
                BusinessSection(title:  "Restaurants", businesses: model.restaurants)
                    .frame(alignment: .leading)
                
                BusinessSection(title: "Sights", businesses: model.sights )
                    .frame(alignment: .leading)
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    
    static var previews: some View {
        BusinessList()    
    }
}
