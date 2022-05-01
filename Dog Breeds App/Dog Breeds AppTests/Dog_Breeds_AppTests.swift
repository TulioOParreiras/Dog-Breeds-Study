//
//  Dog_Breeds_AppTests.swift
//  Dog Breeds AppTests
//
//  Created by Tulio de Oliveira Parreiras on 3/4/2022.
//

import XCTest
@testable import Dog_Breeds_App

class Dog_Breeds_AppTests: XCTestCase {

    func test_viewLoad_rendersDogBreeds() {
        let loader = MockDogBreedsLoader()
        let sut = BreedListViewController()
        sut.setLoader(loader)
        
        sut.loadViewIfNeeded()
        
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
        loader.completeLoading(with: dogBreeds)
        
        let dataSource = sut.tableView.dataSource
        let numberOfRows = dataSource?.tableView(sut.tableView,
                                                 numberOfRowsInSection: 0)
        let expectedNumberOfRows = dogBreeds.count
        
        guard numberOfRows == expectedNumberOfRows else {
            XCTFail("Expected to have \(expectedNumberOfRows) cells, got \(String(describing: numberOfRows)) instead")
            return
        }
        
        dogBreeds.enumerated().forEach { index, dogBreed in
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
            if index % 2 == 0 {
                XCTAssertEqual(cell?.backgroundColor, UIColor.lightGray.withAlphaComponent(0.2))
            } else {
                XCTAssertEqual(cell?.backgroundColor, nil)
            }
        }
    }
    
}


class MockDogBreedsLoader: DogBreedsLoader {
    
    var loadRequests = [((Result<[DogBreed], Error>) -> Void)]()
    
    func load(completion: @escaping (Result<[DogBreed], Error>) -> Void) {
        loadRequests.append(completion)
    }
    
    func completeLoading(with dogBreeds: [DogBreed], at index: Int = 0) {
        loadRequests[index](.success(dogBreeds))
    }
    
}
