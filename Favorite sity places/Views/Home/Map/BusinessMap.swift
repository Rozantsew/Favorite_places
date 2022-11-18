//
//  BusinessMap.swift
//  Favorite sity places
//
//  Created by Mykhailo Rozantsev on 17/11/2022.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    @Binding var selectedBusiness: Business?  
    
    var location:[MKPointAnnotation] {
    
        var annotations = [MKPointAnnotation]()
        
        // Create a set of annotations from your list of businesses
        for business in model.restaurants + model.sights {
            
            // If the business has a lat/long, create an MKPointAnnotation for it
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                
                // Create a new annotation
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotations.append(a)
            }
        }
        return annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        
        // Make the user show up on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        // TODO: Set the region
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Remove all annotation
        uiView.removeAnnotations(uiView.annotations)
        
        // Add the ones based on the business
        uiView.addAnnotations(self.location)
        uiView.showAnnotations(self.location, animated: true)
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    // MARK - Coordinator class
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        // Creating new coordinator and passing data from parent EnviromentObject
        var map: BusinessMap
        
        init(map: BusinessMap) {
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            // If the annotation is the user blue dot, return nil
            if annotation is MKUserLocation {
                return nil
            }
            
            // Check if there's reusable annotation view first
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseID)
            
            if annotationView == nil {
                
                // Create a new one
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseID)
                
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            else {
                // We got a reusable one
                annotationView!.annotation = annotation
            }
            
            
            // Return it
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            // User tapped on the annotation view
            
            // Get the business object that this annotation represents
            // Loop trough businesses in the model and find a match
            for business in map.model.restaurants + map.model.sights {
                if business.name == view.annotation?.title {
                    // Set the selectedBusiness property to that business object
                    map.selectedBusiness = business
                    return
                }
            }
        }
    }
    
}
