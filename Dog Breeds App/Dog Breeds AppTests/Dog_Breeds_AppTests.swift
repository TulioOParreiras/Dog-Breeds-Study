//
//  Dog_Breeds_AppTests.swift
//  Dog Breeds AppTests
//
//  Created by Tulio de Oliveira Parreiras on 3/4/2022.
//

import XCTest
@testable import Dog_Breeds_App

class BreedListViewController: UITableViewController {    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
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
    
}
