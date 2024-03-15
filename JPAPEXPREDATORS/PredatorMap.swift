//
//  PredatorMap.swift
//  JPAPEXPREDATORS
//
//  Created by Ekomobong Edeme on 15/03/2024.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    
    let predators = Predators()
    
    
    @State var position:MapCameraPosition
    @State var satelite:Bool = false
    
    var body: some View {
        Map(position:$position ){
            ForEach(predators.apexPreadators){predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .shadow(color:.white,radius: 3)
                        .scaleEffect(x:-1)
                }
            }
        }
        .mapStyle(satelite ? .imagery(elevation: .realistic)
                  : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button(action: {
                satelite.toggle()
            }, label: {
                Image(systemName: satelite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
            })
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPreadators[2].location,
                                            distance: 1000,
                                            heading:250 ,
                                            pitch: 80))
    )
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
