//
//  ContentView.swift
//  JPAPEXPREDATORS
//
//  Created by Ekomobong Edeme on 14/03/2024.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    var body: some View {
        List(predators.apexPreadators){ predator in
            VStack(alignment:.leading) {
                HStack{
                    //Dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .shadow(color: .white, radius: 1)
                    
                    VStack(alignment:.leading){
                        //Name
                        Text(predator.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        //Type
                        Text(predator.type.rawValue.capitalized)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal,13)
                            .padding(.vertical, 5)
                            .background(predator.type.background)
                            .clipShape(.capsule)
                            
                        
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
