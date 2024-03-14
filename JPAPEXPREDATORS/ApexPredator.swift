//
//  ApexPredator.swift
//  JPAPEXPREDATORS
//
//  Created by Ekomobong Edeme on 14/03/2024.
//

import Foundation

struct ApexPredator:Decodable {
    let id:Int
    let name:String
    let type:String
    let latitude:Double
    let longitude:Double
    let movies:[String]
    let movieScenes:[MovieScene]
    let link:String
   
    struct MovieScene:Decodable{
        let id:Int
        let movie:String
        let sceneDescription:String
    }
}
