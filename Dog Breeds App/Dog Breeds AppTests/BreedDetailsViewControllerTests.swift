//
//  BreedDetailsViewControllerTests.swift
//  Dog Breeds AppTests
//
//  Created by Tulio de Oliveira Parreiras on 1/5/2022.
//

import XCTest

@testable import Dog_Breeds_App

class BreedDetailsViewControllerTests: XCTestCase {
    
    func test_renderBreedDetails_whenViewLoad() {
        let dogBreed = DogBreed(bred_for: "A bred for",
                                image: nil,
                                life_span: "A span",
                                name: "A name",
                                origin: "An origin",
                                temperament: "A temperament")
        let (sut, _) = makeSUT(dogBreed: dogBreed)
        sut.loadViewIfNeeded()
        
        assertThat(sut, renderDogBreedDetails: dogBreed)
    }
    
    func test_renderBreedDetails_whenViewLoad_withNilValues() {
        let dogBreed = DogBreed(name: "A name",
                                temperament: "A temperament")
        let (sut, _) = makeSUT(dogBreed: dogBreed)
        sut.loadViewIfNeeded()
        
        assertThat(sut, renderDogBreedDetails: dogBreed)
    }
    
    func test_loadImage_whenViewLoad() {
        let image = BreedImage(height: 100, url: URL(string: "https://any-url.com")!, width: 1000)
        let dogBreed = DogBreed(image: image,
                                name: "A name",
                                temperament: "A temperament")
        let (sut, loader) = makeSUT(dogBreed: dogBreed)
        
        XCTAssertEqual(loader.loadedURL, nil)
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(loader.loadedURL, image.url)
    }
    
    // MARK: - Helpers
    
    func makeSUT(dogBreed: DogBreed) -> (sut: BreedDetailsViewController, loader: ImageLoaderSpy) {
        let loader = ImageLoaderSpy()
        let sut = BreedDetailsViewController()
        sut.dogBreed = dogBreed
        sut.loader = loader
        return (sut, loader)
    }
    
    func assertThat(_ sut: BreedDetailsViewController, renderDogBreedDetails dogBreed: DogBreed) {
        XCTAssertEqual(sut.title, dogBreed.name)
        XCTAssertEqual(sut.bredForLabel.text, dogBreed.bred_for)
        XCTAssertEqual(sut.lifeSpanLabel.text, dogBreed.life_span)
        XCTAssertEqual(sut.nameLabel.text, dogBreed.name)
        XCTAssertEqual(sut.originLabel.text, dogBreed.origin)
        XCTAssertEqual(sut.temperamentLabel.text, dogBreed.temperament)
    }

    final class ImageLoaderSpy: ImageLoader {
        var loadedURL: URL?
        
        func loadImage(fromURL url: URL) {
            loadedURL = url
        }
    }
}
