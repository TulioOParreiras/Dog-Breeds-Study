//
//  Dog_Breeds_AppTests.swift
//  Dog Breeds AppTests
//
//  Created by Tulio de Oliveira Parreiras on 3/4/2022.
//

import XCTest
@testable import Dog_Breeds_App

class BreedListViewController: UITableViewController {
    
    let names: Array = [
        "Affenpinscher",
        "Afghan Hound",
        "African Hunting Dog",
        "Airedale Terrier",
        "Akbash Dog",
        "Akita",
        "Alapaha Blue Blood",
        "Alaskan Husky",
        "Alaskan Malamute",
        "American Bulldog",
    ]
    
    let temperaments: Array = [
        "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving",
        "Aloof, Clownish, Dignified, Independent, Happy",
        "Wild, Hardworking, Dutiful",
        "Outgoing, Friendly, Alert, Confident, Intelligent, Courageous",
        "Loyal, Independent, Intelligent, Brave",
        "Docile, Alert, Responsive, Dignified, Composed, Friendly, Receptive, Faithful, Courageous",
        "Loving, Protective, Trainable, Dutiful, Responsible",
        "Friendly, Energetic, Loyal, Gentle, Confident",
        "Friendly, Affectionate, Devoted, Loyal, Dignified, Playful",
        "Friendly, Assertive, Energetic, Loyal, Gentle, Confident, Dominant",
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = UITableViewCell()
        var config = cell.defaultContentConfiguration()
        config.text = names[row]
        config.secondaryText = temperaments[row]
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
        XCTAssertEqual(numberOfRows, 10)
    }
    
    func test_viewLoad_rendersBreedsNames() {
        let sut = BreedListViewController()
        
        sut.loadViewIfNeeded()
        
        let dataSource = sut.tableView.dataSource
        let names: Array = [
            "Affenpinscher",
            "Afghan Hound",
            "African Hunting Dog",
            "Airedale Terrier",
            "Akbash Dog",
            "Akita",
            "Alapaha Blue Blood",
            "Alaskan Husky",
            "Alaskan Malamute",
            "American Bulldog",
        ]
        
        for index in 0 ..< names.count {
            let name = names[index]
            let cell = dataSource?.tableView(sut.tableView,
                                             cellForRowAt: IndexPath(row: index,
                                                                     section: 0))
            let config = cell?.contentConfiguration as? UIListContentConfiguration
            XCTAssertEqual(config?.text, name)
        }
    }
    
    func test_viewLoad_rendersBreedsTemperaments() {
        let sut = BreedListViewController()
        
        sut.loadViewIfNeeded()
        
        let dataSource = sut.tableView.dataSource
        let temperaments: Array = [
            "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving",
            "Aloof, Clownish, Dignified, Independent, Happy",
            "Wild, Hardworking, Dutiful",
            "Outgoing, Friendly, Alert, Confident, Intelligent, Courageous",
            "Loyal, Independent, Intelligent, Brave",
            "Docile, Alert, Responsive, Dignified, Composed, Friendly, Receptive, Faithful, Courageous",
            "Loving, Protective, Trainable, Dutiful, Responsible",
            "Friendly, Energetic, Loyal, Gentle, Confident",
            "Friendly, Affectionate, Devoted, Loyal, Dignified, Playful",
            "Friendly, Assertive, Energetic, Loyal, Gentle, Confident, Dominant",
        ]
        
        for index in 0 ..< temperaments.count {
            let temperament = temperaments[index]
            let cell = dataSource?.tableView(sut.tableView,
                                             cellForRowAt: IndexPath(row: index,
                                                                     section: 0))
            let config = cell?.contentConfiguration as? UIListContentConfiguration
            XCTAssertEqual(config?.secondaryText, temperament)
        }
    }
    
}
