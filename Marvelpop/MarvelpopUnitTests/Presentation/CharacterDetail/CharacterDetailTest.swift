//
//  CharacterDetailTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class CharacterDetailTest: XCTestCase {

    var window: UIWindow!
    var characterRepository: MockCharactersRepository!
    var imageLoaderUseCase: MockImageLoaderUseCase!
    var favouriteRepository: MockFavouritesRepository!
    
    var view: CharacterDetailViewController!
    var presenter: CharacterDetailPresenter!
    var interactor: CharacterDetailInteractor!
    var router: CharacterDetailRouter!
    
    override func setUpWithError() throws {
        window = UIWindow()
        favouriteRepository = MockFavouritesRepository()
        characterRepository = MockCharactersRepository()
        imageLoaderUseCase = MockImageLoaderUseCase()
    }

    override func tearDownWithError() throws {
        window = nil
        favouriteRepository = nil
        characterRepository = nil
        imageLoaderUseCase = nil
        view = nil
        presenter = nil
        interactor = nil
        router = nil
    }
    
    private func buildTestingScenario() {
        view = CharacterDetailRouter.createModule(characterID: 1234, characters: characterRepository, favourites: favouriteRepository, imageLoader: imageLoaderUseCase) as? CharacterDetailViewController
        presenter = view.presenter as? CharacterDetailPresenter
        interactor = presenter.interactor as? CharacterDetailInteractor
        router = presenter.router as? CharacterDetailRouter
        window.addSubview(view.view)
        window.makeKeyAndVisible()
    }
    
    func test_viewDidLoad() throws {
        // Given a character with image
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
        imageLoaderUseCase.image = ImageAssets.CharacterDetail.logo.image
        
        // Given a testing scenario
        characterRepository.character = character
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then the view has loaded the table items correctly
        let imageCell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! CharacterDetailImageTableViewCell
        XCTAssertEqual(imageCell.characterImageView.image, ImageAssets.CharacterDetail.logo.image)
        
        let dataCell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! CharacterDetailDataTableViewCell
        XCTAssertEqual(dataCell.nameLabel.text, character.displayName)
        XCTAssertEqual(dataCell.descriptionLabel.text, character.displayDescription)
    }
    
    func test_onFavourite_save() throws {
        // Given a character with image
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
        imageLoaderUseCase.image = ImageAssets.CharacterDetail.logo.image
        
        // Given a testing scenario
        characterRepository.character = character
        buildTestingScenario()
        view.loadViewIfNeeded()
        
        // When the user taps on favourite button
        view.onFavourite()
        
        // Then the character is saved as favourite
        XCTAssertEqual(favouriteRepository.favouriteCharacterSaved, character)
    }
    
    func test_onFavourite_delete() throws {
        // Given a character with image
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
        imageLoaderUseCase.image = ImageAssets.CharacterDetail.logo.image
        
        // Given the character saved as favourite
        favouriteRepository.mockCharacterFavourite = character
        
        // Given a testing scenario
        characterRepository.character = character
        buildTestingScenario()
        view.loadViewIfNeeded()
        
        // When the user taps on favourite button
        view.onFavourite()
        
        // Then the character is deleted as favourite
        XCTAssertEqual(favouriteRepository.favouriteCharacterDeleted, character)
    }
}
