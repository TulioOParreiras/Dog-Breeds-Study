//
//  DogBreedsLoader.swift
//  Dog Breeds App
//
//  Created by Tulio de Oliveira Parreiras on 10/4/2022.
//

import Foundation

protocol DogBreedsLoader {
    func load(completion: @escaping (Result<[DogBreed], Error>) -> Void)
}
