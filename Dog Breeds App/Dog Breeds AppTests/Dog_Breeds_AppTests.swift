//
//  Dog_Breeds_AppTests.swift
//  Dog Breeds AppTests
//
//  Created by Tulio de Oliveira Parreiras on 3/4/2022.
//

import XCTest
@testable import Dog_Breeds_App

class DogBreed {
    
    let name: String
    let temperament: String
    
    init(name: String, temperament: String) {
        self.name = name
        self.temperament = temperament
    }
    
}

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

class Dog_Breeds_AppTests: XCTestCase {

    func test_viewLoad_rendersDogBreeds() {
        let sut = BreedListViewController()
        
        sut.loadViewIfNeeded()
        
        let dataSource = sut.tableView.dataSource
        let numberOfRows = dataSource?.tableView(sut.tableView,
                                                 numberOfRowsInSection: 0)
        let expectedNumberOfRows = 10
        guard numberOfRows == expectedNumberOfRows else {
            XCTFail("Expected to have \(expectedNumberOfRows) cells, got \(String(describing: numberOfRows)) instead")
            return
        }
        
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
        
        for index in 0 ..< dogBreeds.count {
            let dogBreed = dogBreeds[index]
            let name = dogBreed.name
            let temperament = dogBreed.temperament
            let cell = dataSource?.tableView(sut.tableView,
                                             cellForRowAt: IndexPath(row: index,
                                                                     section: 0))
            guard let config = cell?.contentConfiguration as? UIListContentConfiguration else {
                XCTFail("Expected that cell configuration is \(UIListContentConfiguration.self), got \(String(describing: cell?.contentConfiguration)) instead")
                return
            }
            XCTAssertEqual(config.text, name)
            XCTAssertEqual(config.secondaryText, temperament)
        }
    }
    
}
