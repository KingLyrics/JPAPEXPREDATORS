//
//  ContentView.swift
//  JPAPEXPREDATORS
//
//  Created by Ekomobong Edeme on 14/03/2024.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    
    @State var searchText: String = ""
    
    var filteredDinos: [ApexPredator] {
        if searchText.isEmpty {
            return predators.apexPreadators
        } else {
            return predators.apexPreadators.filter {
                predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                if filteredDinos.isEmpty {
                    Text("Dino Not Found")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                } else {
                    ForEach(filteredDinos) { predator in
                        VStack(alignment: .leading) {
                            NavigationLink {
                                Image(predator.image)
                                    .resizable()
                                    .scaledToFit()
                            } label: {
                                HStack {
                                    // Dino image
                                    Image(predator.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .shadow(color: .white, radius: 1)
                                    
                                    VStack(alignment: .leading) {
                                        // Name
                                        Text(predator.name)
                                            .fontWeight(.bold)
                                        
                                        // Type
                                        Text(predator.type.rawValue.capitalized)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .padding(.horizontal, 13)
                                            .padding(.vertical, 5)
                                            .background(predator.type.background)
                                            .clipShape(.capsule)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
        }
        .preferredColorScheme(.dark)
    }
}


#Preview {
    ContentView()
}
