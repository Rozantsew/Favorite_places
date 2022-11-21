//
//  DeniedView.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 21/11/2022.
//

import SwiftUI

struct LocationDeniedView: View {
    
    private let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        VStack (spacing: 20) {
            
            Spacer()
            
            Text("Whoops!")
                .font(.title)

            Text("We need your location to provide you with the bestsights in the sity. You can change your decision at any time in Settings.")
            
            Spacer()
            
            Button {
                // Open settings by getting the settings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
               
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                        
                    Text("Go to settings")
                        .bold()
                        .foregroundColor(backgroundColor)
                        .padding()
                }
            }
            .padding()
            
            Spacer()
        }
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct DeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
