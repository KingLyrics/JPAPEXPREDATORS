//
//  PredatorDetail.swift
//  JPAPEXPREDATORS
//
//  Created by Ekomobong Edeme on 15/03/2024.
//

import SwiftUI

struct PredatorDetail: View {
    let predator:ApexPredator
    
    var body: some View {
        GeometryReader{geo in
            ScrollView{
                ZStack(alignment:.bottomTrailing){
                    //Background Image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    
                    //Dino Image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3)
                        .scaleEffect(x:-1)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 7)
                        .offset(y:20)
                    
                }
                VStack(alignment: .leading){
                    
                    //Name
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    //Current location
                    
                    //Appears in
                    Text("Appears in: ")
                        .font(.title3)
                    ForEach(predator.movies, id:\.self){movie in
                        Text("◦" + movie)
                            .font(.subheadline)
                    }
                    
                    //Moive moments
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    ForEach(predator.movieScenes){scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical,1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    //Link to webpage
                    Text("Read more:")
                        .font(.caption)
                    Link(predator.link, destination:URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                        
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
               
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPreadators[2])
}
