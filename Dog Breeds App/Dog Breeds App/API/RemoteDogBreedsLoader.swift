//
//  RemoteDogBreedsLoader.swift
//  Dog Breeds App
//
//  Created by Tulio de Oliveira Parreiras on 10/4/2022.
//

import Foundation

class RemoteDogBreedsLoader: DogBreedsLoader {
    
    func load(completion: @escaping (Result<[DogBreed], Error>) -> Void) {
        let url = URL(string: "https://api.thedogapi.com/v1/breeds")!
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.addValue("0810897f-072d-4841-8ab1-78cb79205230", forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: urlRequest as URLRequest) { data, response, error in
            if let data = data {
                do {
                    let dogBreedsResponse = try JSONDecoder().decode([DogBreed].self, from: data)
                    completion(.success(dogBreedsResponse))
                } catch (let decodeError) {
                    completion(.failure(decodeError))
                }
            }
            if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
