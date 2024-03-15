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
                
                //Name
                
                //Current location
                
                //Appears in
                
                //Moive moments
                
                //Link to webpage
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPreadators[2])
}
