//
//  ContentView.swift
//  JPAPEXPREDATORS
//
//  Created by Ekomobong Edeme on 14/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State var searchText: String = ""
    @State var alphabetical:Bool = false
    @State var currentSelection = Predatortype.all
    
    let predators = Predators()

    
    var filteredDinos: [ApexPredator] {
        predators.filter(by: currentSelection)
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
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
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        withAnimation{
                            alphabetical.toggle()
                        }
                    }label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                
                ToolbarItem(placement:.topBarTrailing){
                    Menu{
                        Picker("Filter", selection: $currentSelection.animation()){
                            ForEach(Predatortype.allCases) { type  in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    }label:{
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}


#Preview {
    ContentView()
}
