//
//  BreedListViewController.swift
//  Dog Breeds App
//
//  Created by Tulio de Oliveira Parreiras on 3/4/2022.
//

import UIKit

class BreedListViewController: UITableViewController {
    
    let dogBreeds: [DogBreed] = [
        DogBreed(name: "Affenpinscher", temperament: "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving"),
        DogBreed(name: "Afghan Hound", temperament: "Aloof, Clownish, Dignified, Independent, Happy"),
        DogBreed(name: "African Hunting Dog", temperament: "Wild, Hardworking, Dutiful"),
        DogBreed(name: "Airedale Terrier", temperament: "Outgoing, Friendly, Alert, Confident, Intelligent, Courageous"),
        DogBreed(name: "Akbash Dog", temperament: "Loyal, Independent, Intelligent, Brave"),
        DogBreed(name: "Akita", temperament: "Docile, Alert, Responsive, Dignified, Composed, Friendly, Receptive, Faithful, Courageous"),
        DogBreed(name: "Alapaha Blue Blood", temperament: "Loving, Protective, Trainable, Dutiful, Responsible"),
        DogBreed(name: "Alaskan Husky", temperament: "Friendly, Energetic, Loyal, Gentle, Confident"),
        DogBreed(name: "Alaskan Malamute", temperament: "Friendly, Affectionate, Devoted, Loyal, Dignified, Playful"),
        DogBreed(name: "American Bulldog", temperament: "Friendly, Assertive, Energetic, Loyal, Gentle, Confident, Dominant"),
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogBreeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let breed = dogBreeds[row]
        let cell = UITableViewCell()
        var config = cell.defaultContentConfiguration()
        config.text = breed.name
        config.secondaryText = breed.temperament
        cell.contentConfiguration = config
        return cell
    }
    
}
