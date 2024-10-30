//
//  HomePageView.swift
//  Disneyland Explorer
//
//  Created by Danielle Ellis on 10/26/24.
//

import SwiftUI

struct HomePageView: View {
    @StateObject private var viewModel = HomePageViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // background
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Disney Explorer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .fontDesign(.monospaced)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                    
                    // display favorite items using the ViewModel's data
                    List(viewModel.favorites) { item in
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(.trailing)
                            
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                                Text(item.category)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .fontDesign(.monospaced)
                            }
                            
                            Spacer()
                        }
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue.opacity(0.6))
                        )
                    }
                    .listStyle(InsetGroupedListStyle())
                    .scrollContentBackground(.hidden)
                }
                .padding(8)
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        viewModel.reloadHomeView()  // reload home page
                    }) {
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
        .id(viewModel.reloadHome) // reload on `reloadHome` change
    }
}

#Preview {
    HomePageView()
}
