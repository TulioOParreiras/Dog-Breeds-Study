//
//  BreedListViewController.swift
//  Dog Breeds App
//
//  Created by Tulio de Oliveira Parreiras on 3/4/2022.
//

import UIKit

protocol DogBreedsLoader {
    func load(completion: @escaping ([DogBreed]?, Error?) -> Void)
}

class RemoteDogBreedsLoader: DogBreedsLoader {
    
    func load(completion: @escaping ([DogBreed]?, Error?) -> Void) {
        let url = URL(string: "https://api.thedogapi.com/v1/breeds")!
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.addValue("0810897f-072d-4841-8ab1-78cb79205230", forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: urlRequest as URLRequest) { data, response, error in
            if let data = data {
                do {
                    let dogBreedsResponse = try JSONDecoder().decode([DogBreed].self, from: data)
                    completion(dogBreedsResponse, nil)
                } catch (let decodeError) {
                    completion(nil, decodeError)
                }
            }
            if let error = error {
                completion(nil, error)
            }
        }.resume()
        
    }
    
}

class BreedListViewController: UITableViewController {
    
    var dogBreeds: [DogBreed] = []
    
    var loader: DogBreedsLoader? = RemoteDogBreedsLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader?.load(completion: { dogBreeds, error in
            if let dogBreeds = dogBreeds {
                self.dogBreeds = dogBreeds
                if Thread.isMainThread {
                    self.tableView.reloadData()
                } else {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            if let error = error {
                print("Failure with error: ", error)
            }
        })
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogBreeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let breed = dogBreeds[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = breed.name
        config.secondaryText = breed.temperament
        cell.contentConfiguration = config
        cell.backgroundColor = row.isMultiple(of: 2) ? UIColor.lightGray.withAlphaComponent(0.2) : nil
        return cell
    }
    
}
