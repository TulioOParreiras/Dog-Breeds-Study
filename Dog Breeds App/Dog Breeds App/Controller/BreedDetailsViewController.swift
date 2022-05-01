//
//  BreedDetailsViewController.swift
//  Dog Breeds App
//
//  Created by Tulio de Oliveira Parreiras on 1/5/2022.
//

import UIKit

protocol ImageLoader {
    func loadImage(fromURL url: URL)
}

class BreedDetailsViewController: UIViewController {
    var dogBreed: DogBreed?
    
    let bredForLabel = UILabel()
    let lifeSpanLabel = UILabel()
    let nameLabel = UILabel()
    let originLabel = UILabel()
    let temperamentLabel = UILabel()
    
    var text: String = ""
    
    var loader: ImageLoader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = dogBreed?.name
        bredForLabel.text = dogBreed?.bred_for
        lifeSpanLabel.text = dogBreed?.life_span
        nameLabel.text = dogBreed?.name
        originLabel.text = dogBreed?.origin
        temperamentLabel.text = dogBreed?.temperament
        
        text = dogBreed?.life_span ?? ""
        
        if let url = dogBreed?.image?.url {
            loader?.loadImage(fromURL: url)
        }
    }
}
