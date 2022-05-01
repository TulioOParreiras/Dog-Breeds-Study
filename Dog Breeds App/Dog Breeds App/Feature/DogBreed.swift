//
//  DogBreed.swift
//  Dog Breeds App
//
//  Created by Tulio de Oliveira Parreiras on 3/4/2022.
//

import Foundation

class DogBreed: Decodable {
    
    let bred_for: String?
    let image: BreedImage?
    let life_span: String?
    let name: String
    let origin: String?
    let temperament: String?
    
    init(bred_for: String? = nil,
         image: BreedImage? = nil,
         life_span: String? = nil,
         name: String,
         origin: String? = nil,
         temperament: String) {
        self.bred_for = bred_for
        self.image = image
        self.life_span = life_span
        self.name = name
        self.origin = origin
        self.temperament = temperament
    }

}

struct BreedImage: Decodable {
    let height: Int
    let url: URL
    let width: Int
}
