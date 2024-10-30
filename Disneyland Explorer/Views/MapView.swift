//
//  MapView.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()

    var body: some View {
        ZStack {
            Color.clear
                .gradientBackground()

            VStack {
                HStack {
                    Text("Park Map")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .fontDesign(.monospaced)
                        .foregroundColor(.white)
                        .padding(.top, 8)
                }
                
                Map(
                    coordinateRegion: $viewModel.region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    annotationItems: viewModel.annotations
                ) { item in
                    MapAnnotation(coordinate: item.mapItem.placemark.coordinate) {
                        VStack {
                            Text(item.mapItem.name ?? "Unknown")
                                .font(.caption)
                                .padding(5)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(5)
                            
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.purple)
                                .font(.title)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .frame(height: 300)
                .padding()
                .padding(.top, 10)
                
                Spacer()
                
                HStack {
                    TextField("Search places nearby...", text: $viewModel.searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .fontDesign(.monospaced)
                        .padding(.leading, 8)
                    
                    Button(action: {
                        viewModel.searchPlaces(query: viewModel.searchQuery)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue.opacity(0.8))
                            .clipShape(Circle())
                    }
                    .padding(.trailing)
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
                
                List(viewModel.annotations) { item in
                    Text(item.mapItem.name ?? "Unknown")
                }
                .listStyle(PlainListStyle())
                .frame(maxHeight: 300)
                .padding(.bottom, 10)
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 10)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                NavigationLink(destination: HomePageView()) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                }
                Spacer()
                NavigationLink(destination: MapView()) {
                    Image(systemName: "map.fill")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                }
                Spacer()
                NavigationLink(destination: RideView()) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    MapView()
}
