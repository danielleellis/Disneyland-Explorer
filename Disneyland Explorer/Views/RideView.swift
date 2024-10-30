//
//  RideView.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/25/24.
//

import SwiftUI

struct RideView: View {
    @StateObject private var viewModel = RideViewModel() // attach ViewModel
    
    var body: some View {
        ZStack {
            // background gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Wait Times")
                    .font(.largeTitle)
                    .fontDesign(.monospaced)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .padding(.bottom, -5)
                
                // list of rides
                List(viewModel.filteredRides) { ride in
                    HStack {
                        Image(ride.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .padding(.trailing, 10)
                        
                        VStack(alignment: .leading) {
                            Text(ride.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text("Wait time: \(ride.waitTime)")
                                .font(.subheadline)
                                .fontDesign(.monospaced)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                    }
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(0.6))
                    )
                }
                .listStyle(InsetGroupedListStyle())
                .scrollContentBackground(.hidden)
                .padding(.horizontal, 5)
            }
            
            // search bar to search for rides
            VStack {
                Spacer()
                HStack {
                    TextField("Search for a ride...", text: $viewModel.searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .fontDesign(.monospaced)
                        .padding()
                    
                    Button(action: {
                        viewModel.searchQuery = viewModel.searchQuery.trimmingCharacters(in: .whitespaces)
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
                .padding(.bottom, 20)
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
    RideView()
}
