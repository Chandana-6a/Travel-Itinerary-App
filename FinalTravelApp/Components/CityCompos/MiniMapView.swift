//
//  MiniMapView.swift
//  Final Travel App
//
//  Created by chandana on 13/04/24.
//
//

import SwiftUI
import MapKit

struct MiniMapView: View {

    var Name: String
    @State private var region = MKCoordinateRegion() // No arguments needed

    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .top) {
                    Map(coordinateRegion: $region, showsUserLocation: true)
                        .frame(width: 354, height: 384)
                        .cornerRadius(10)
                        .padding(20)
                        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 8)

                    Text(Name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top, 180)

                    LoginButtonView(action: "Open in map", width: 147, destination: AnyView(MapView()))
                        .padding(.top, 300)
                }
            }
            .onAppear {
                geocodeLocation(Name) { [self] coordinates in
                    guard let coordinates = coordinates else { return }
                    region.center = coordinates

                    // Adaptive zoom based on place type (if desired)
                    let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
                    geocoder.reverseGeocodeLocation(location) { placemarks, error in
                        if let error = error {
                            print(error.localizedDescription)
                            return
                        }

                        guard let placemark = placemarks?.first else {
                            return
                        }

                        let locality = placemark.locality ?? ""
                        let administrativeArea = placemark.administrativeArea ?? ""
                        let country = placemark.country ?? ""

                        // Adjusts zoom based on place type
                        if locality.isEmpty && administrativeArea.isEmpty && country != "" {
                            // Zoom out for countries
                            region.span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
                        } else if locality != "" {
                            // Zoom in for cities
                            region.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                        } else {
                            // Default zoom for other cases
                            region.span = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2) // Sets default zoom
                        }
                    }
                }
            }
        }
    }

    private let geocoder = CLGeocoder()

    private func geocodeLocation(_ name: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        geocoder.geocodeAddressString(name) { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }

            guard let placemark = placemarks?.first, let location = placemark.location else {
                completion(nil)
                return
            }

            completion(location.coordinate)
        }
    }
}

#Preview {
    MiniMapView(Name: "japan")
}
