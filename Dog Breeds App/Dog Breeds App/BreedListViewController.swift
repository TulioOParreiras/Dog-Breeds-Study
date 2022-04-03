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
        DogBreed(name: "American Bully", temperament: "Strong Willed, Stubborn, Friendly, Clownish, Affectionate, Loyal, Obedient, Intelligent, Courageous"),
        DogBreed(name: "American Eskimo Dog", temperament: "Friendly, Alert, Reserved, Intelligent, Protective"),
        DogBreed(name: "American Eskimo Dog (Miniature)", temperament: "Friendly, Alert, Reserved, Intelligent, Protective"),
        DogBreed(name: "American Foxhound", temperament: "Kind, Sweet-Tempered, Loyal, Independent, Intelligent, Loving"),
        DogBreed(name: "American Pit Bull Terrier", temperament: "Strong Willed, Stubborn, Friendly, Clownish, Affectionate, Loyal, Obedient, Intelligent, Courageous"),
        DogBreed(name: "American Staffordshire Terrier", temperament: "Tenacious, Friendly, Devoted, Loyal, Attentive, Courageous"),
        DogBreed(name: "American Water Spaniel", temperament: "Friendly, Energetic, Obedient, Intelligent, Protective, Trainable"),
        DogBreed(name: "Anatolian Shepherd Dog", temperament: "Steady, Bold, Independent, Confident, Intelligent, Proud"),
        DogBreed(name: "Appenzeller Sennenhund", temperament: "Reliable, Fearless, Energetic, Lively, Self-assured")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        } else {
            cell.backgroundColor = nil
        }
        return cell
    }
    
}
