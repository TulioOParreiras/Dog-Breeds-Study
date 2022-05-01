//
//  BreedListViewController.swift
//  Dog Breeds App
//
//  Created by Tulio de Oliveira Parreiras on 3/4/2022.
//

import UIKit

class BreedListViewController: UITableViewController {
    
    var dogBreeds: [DogBreed] = []
    
    var loader: DogBreedsLoader?
    
    func setLoader(_ loader: DogBreedsLoader) {
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestLoadContent()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func requestLoadContent() {
        loader?.load(completion: { result in
            guard Thread.isMainThread else {
                DispatchQueue.main.async {
                    self.handleResult(result)
                }
                return
            }
            self.handleResult(result)
        })
    }
    
    func handleResult(_ result: Result<[DogBreed], Error>) {
        switch result {
        case .success(let dogBreeds):
            self.dogBreeds = dogBreeds
            self.tableView.reloadData()
        case .failure(let error):
            print("Failure with error: ", error)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UIViewController()
        navigationController?.pushViewController(controller, animated: false)
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
