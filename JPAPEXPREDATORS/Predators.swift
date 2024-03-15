//
//  Predators.swift
//  JPAPEXPREDATORS
//
//  Created by Ekomobong Edeme on 14/03/2024.
//

import Foundation

class Predators{
    var allApexPredators:[ApexPredator] = []
    
    var apexPreadators:[ApexPredator] = []
    
    init(){
        DecodeApexPreadatorData()
    }
    
    func DecodeApexPreadatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPreadators = allApexPredators
            }catch{
                print("Error decoding json data: \(error)")
            }
        }
    }
    
    func search(for searchTerm:String)->[ApexPredator]{
        if searchTerm.isEmpty {
            return apexPreadators
        } else {
            return apexPreadators.filter {
                predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphabetical:Bool){
        apexPreadators.sort{predator1, predator2 in
            if alphabetical{
                predator1.name < predator2.name
            }else{
                predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type: Predatortype){
        if type == .all{
            apexPreadators = allApexPredators
        }else{
            apexPreadators =  allApexPredators.filter{predator in
                predator.type == type
            }
        }
    }
}
