//
//  BusinessDetail.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 07/11/2022.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    @State private var showDirections = false
    
    var body: some View {
        VStack (alignment: .leading) {
            
            VStack (alignment: .leading, spacing: 0) {
                GeometryReader() { geometry in
                    // Business image
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all, edges: .top)
                
                
                // Open / close indicator
                ZStack (alignment: .leading) {
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .blue : .gray)
                    
                    Text(!business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                }
            }
            
            Group {
                    BusinessTitle(business: business )
                    
                    Divider()
                    
                    // Phone
                    HStack {
                        Text("Phone: ")
                        Text(business.displayPhone ?? "")
                        Spacer()
                        Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                    }
                    .padding()
                    
                    Divider()
                    
                    
                    
                    HStack {
                        Text("Reviews: ")
                        Text(String(business.reviewCount ?? 0))
                        Spacer()
                        Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                    }
                    .padding()
                    
                    Divider()
                    // Website
                    HStack {
                        Text("Website: ")
                        Text(business.url ?? "")
                            .lineLimit(1 )
                        Spacer()
                        Link("Call", destination: URL(string: "\(business.phone ?? "")")!)
                    }
                    .padding()
            
                
                // Get direction button
                Button {
                    // Show directions
                    showDirections = true
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                        
                        Text("Get directions")
                            .foregroundColor(.white)
                            .bold()
                    }
                 }
                .padding()
                .sheet(isPresented: $showDirections) {
                    DirectionsView(business: business)
                }
            }
        }
    }
}
