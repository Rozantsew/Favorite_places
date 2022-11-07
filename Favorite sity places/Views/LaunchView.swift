//
//  ContentView.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 02/11/2022.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack {
           // Detect the authorization status of geolocating the user
            
            if model.authorizationState == .notDetermined {
                // If undetermined, show onboarding
            }
            else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
                 // If approved, show home view
                HomeView()
            }
            else {
                // If denied show denied view
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
