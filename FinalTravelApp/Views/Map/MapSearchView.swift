//
//  MapSearchView.swift
//  Final Travel App
//
//  Created by chandana on 23/04/24.
//

import SwiftUI
import MapKit

struct MapSearchView: View {
    @State private var sourceAddress: String = ""
    @State private var destinationAddress: String = ""
    @State private var directions: [MKRoute.Step] = []
    @State private var routeShown: Bool = false
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 17.4065, longitude: 78.4772), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State private var showRouteMapView = false
    @State private var myregion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 17.385044, longitude: 78.486671),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack(){
                Map(coordinateRegion: $myregion)
                    .ignoresSafeArea()

                VStack {
                    
                    HStack{
                        Spacer()
                        //                        CircularppForScreens(imageUrl: viewModel.currentUser?.ppImageUrl)
                        
                    }
                    .frame( height: 30)
                    .padding(20)
                    
                    Spacer()
                    VStack(spacing: 10) {
                        TextField("Search starting point", text: $sourceAddress)
                            .padding()
                            .frame(width: 350, height: 48)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        TextField("Search to choose destination", text: $destinationAddress)
                            .padding()
                            .frame(width: 350, height: 48)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        Button("Start Navigation") {
                            getDirections()
                        }
                        .frame(width: 190, height: 43)
                        .foregroundColor(.white)
                        .background(Color(.arrow2))
                        .cornerRadius(30)
                        .padding(8)
                    }
                    .frame(width: 390, height: 212)
                    .background(.ultraThinMaterial)
                }

                if routeShown {
                    NavigationLink(destination: RouteMapView(
                        directions: directions,
                        region: Binding(get: { self.region }, set: { self.region = $0 }),
                        sourceAddress: sourceAddress,
                        destinationAddress: destinationAddress
                    )) {
                        Text("View Route")
                            .frame(width: 130, height: 43)
                            .foregroundColor(.white)
                            .background(Color(.arrow2))
                            .cornerRadius(30)
                            .padding()
                            .padding(.top, 250)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }

    // function for getting directions between two places
    func getDirections() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(sourceAddress) { (sourcePlacemarks, error) in
            guard let sourcePlacemark = sourcePlacemarks?.first, error == nil else {
                print("Error finding source location: \(error?.localizedDescription ?? "")")
                return
            }

            geocoder.geocodeAddressString(destinationAddress) { (destinationPlacemarks, error) in
                guard let destinationPlacemark = destinationPlacemarks?.first, error == nil else {
                    print("Error finding destination location: \(error?.localizedDescription ?? "")")
                    return
                }

                let sourceMapItem = MKMapItem(placemark: MKPlacemark(placemark: sourcePlacemark))
                let destinationMapItem = MKMapItem(placemark: MKPlacemark(placemark: destinationPlacemark))

                let request = MKDirections.Request()
                request.source = sourceMapItem
                request.destination = destinationMapItem
                request.transportType = .automobile

                let directions = MKDirections(request: request)
                directions.calculate { (response, error) in
                    guard let route = response?.routes.first, error == nil else {
                        print("Error calculating directions: \(error?.localizedDescription ?? "")")
                        return
                    }

                    self.directions = route.steps
                    self.region = MKCoordinateRegion(route.polyline.boundingMapRect)
                    self.routeShown = true
                }
            }
        }
    }
}

// gives route if exists between places
struct MapingView: UIViewRepresentable {
    var directions: [MKRoute.Step]
    var region: MKCoordinateRegion // No need for Binding here
    let sourceAddress: String
    let destinationAddress: String

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator

        let sourceCoordinate = getCoordinate(from: sourceAddress)
        let destinationCoordinate = getCoordinate(from: destinationAddress)

        // Add source and destination annotations
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.coordinate = sourceCoordinate
        sourceAnnotation.title = "Source"

        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.coordinate = destinationCoordinate
        destinationAnnotation.title = "Destination"

        mapView.addAnnotations([sourceAnnotation, destinationAnnotation])

        // Add route polyline
        let polyline = MKPolyline(coordinates: directions.map { $0.polyline.coordinate }, count: directions.count)
        mapView.addOverlay(polyline)

        // Adjust map region
        mapView.region = region

        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        // Update map region if needed
        mapView.region = region
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    private func getCoordinate(from address: String) -> CLLocationCoordinate2D {
        let geocoder = CLGeocoder()
        var coordinate = CLLocationCoordinate2D()

        geocoder.geocodeAddressString(address) { placemarks, error in
            guard let placemark = placemarks?.first, error == nil else {
                print("Error finding location for address: \(address)")
                return
            }
            coordinate = placemark.location?.coordinate ?? CLLocationCoordinate2D()
        }

        return coordinate
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 5
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}

// gives directions for the route given
struct RouteMapView: View {
    var directions: [MKRoute.Step]
    @Binding var region: MKCoordinateRegion
    let sourceAddress: String
    let destinationAddress: String
    @State private var showDirectionsSheet = false
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom) {
                MapingView(directions: directions, region: region, sourceAddress: sourceAddress, destinationAddress: destinationAddress)
                    .ignoresSafeArea()
                    .overlay(alignment: .bottomTrailing) {
                        VStack(spacing: 15) {
                            MapCompass()
                            MapPitchToggle()
                            MapUserLocationButton()
                        }
                    }
                
                Text("Route")
                    .font(.system(size: 36, weight: .black))
                    .frame(width: 350, alignment: .leading)
                    .padding(.top, -680)
                
                Button("Show Directions") {
                    showDirectionsSheet.toggle()
                }
                .frame(width: 190, height: 43)
                .foregroundColor(.white)
                .background(Color(.arrow2))
                .cornerRadius(30)
                .padding(.bottom, 40)
                .sheet(isPresented: $showDirectionsSheet) {
                    VStack {
                        Text("Directions")
                            .font(.system(size: 26, weight: .bold))
                            .padding([.top,.bottom], 10)
                        
                        List {
                            ForEach(directions, id: \.instructions) { step in
                                Text(step.instructions)
                            }
                            .padding(.vertical, 5)
                        }
                        .padding()
                        
                        Button("Close") {
                            showDirectionsSheet.toggle()
                        }
                        .padding(.top)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}


#Preview {
    MapSearchView()
    
}
    
