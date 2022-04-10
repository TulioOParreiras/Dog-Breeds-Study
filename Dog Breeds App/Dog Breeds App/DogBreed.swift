//
//  DogBreed.swift
//  Dog Breeds App
//
//  Created by Tulio de Oliveira Parreiras on 3/4/2022.
//

import Foundation

class DogBreed: Decodable {
    
    let name: String    
    let temperament: String?
    
    init(name: String, temperament: String?) {
        self.name = name
        self.temperament = temperament
    }
    
}
