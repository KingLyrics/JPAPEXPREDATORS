//
//  PredatorDetail.swift
//  JPAPEXPREDATORS
//
//  Created by Ekomobong Edeme on 15/03/2024.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    let predator:ApexPredator
    @State var postion:MapCameraPosition
    
    var body: some View {
        GeometryReader{geo in
            ScrollView{
                ZStack(alignment:.bottomTrailing){
                    //Background Image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                Gradient.Stop(color: .black, location: 1)
                            ], startPoint: .top, endPoint: .bottom)
                        }
                    
                    
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
                    NavigationLink{
                        
                    } label:{
                        Map(position:$postion){
                            Annotation(predator.name, coordinate: predator.location) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                                
                            }
                            .annotationTitles(.hidden)
                        }
                    }
                    .frame(height: 125)
                    .overlay(alignment: .trailing) {
                        Image(systemName: "greaterthan")
                            .imageScale(.large)
                            .font(.title3)
                            .padding(.trailing, 5)
                    }
                    .overlay(alignment:.topLeading){
                        Text("Current location")
                            .padding([.leading, .bottom], 5)
                            .padding(.trailing, 8)
                            .background(.black.opacity(0.33))
                            .clipShape(.rect(cornerRadii: .init(bottomTrailing: 15)))
                    }
                    
                    .clipShape(.rect(cornerRadius: 15))
                    

                    
                    //Appears in
                    Text("Appears in: ")
                        .font(.title3)
                        .padding(.top)
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
        .toolbarBackground(.automatic)
    }
}


#Preview {
    NavigationStack {
        PredatorDetail(predator: Predators().apexPreadators[2], postion: .camera(MapCamera(centerCoordinate: Predators().apexPreadators[2].location, distance: 30000)))
            .preferredColorScheme(.dark)
    }
}
