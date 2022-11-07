//
//  HomeView.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 07/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            // Determine if we should show list or map
            Text("Should show map")
            if !isMapShowing {
                // Show list
                VStack {
                    HStack {
                        Image(systemName: "location")
                        Text("San francisco")
                        Spacer()
                        Text("Switch to map view ")
                    }
                    Divider()
                    BusinessList()

                }.padding([.horizontal, .top]) 
            }
        }
        else {
        // Still waiting for data so show spinner
        ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
