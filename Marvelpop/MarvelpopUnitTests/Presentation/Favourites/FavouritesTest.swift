//
//  FavouritesTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class FavouritesTest: XCTestCase {

    var window: UIWindow!
    var favouriteRepository: MockFavouritesRepository!
    var imageLoaderUseCase: MockImageLoaderUseCase!
    var coordinator: FakeFavouritesCoordinator!
    
    var view: FavouritesViewController!
    var presenter: FavouritesPresenter!
    var interactor: FavouritesInteractor!
    var router: FavouritesRouter!
    
    override func setUpWithError() throws {
        window = UIWindow()
        favouriteRepository = MockFavouritesRepository()
        imageLoaderUseCase = MockImageLoaderUseCase()
        coordinator = FakeFavouritesCoordinator()
    }

    override func tearDownWithError() throws {
        window = nil
        favouriteRepository = nil
        imageLoaderUseCase = nil
        coordinator = nil
        view = nil
        presenter = nil
        interactor = nil
        router = nil
    }
    
    private func buildTestingScenario() {
        view = FavouritesRouter.createModule(coordinator: coordinator, dataProvider: favouriteRepository, imageLoader: imageLoaderUseCase) as? FavouritesViewController
        presenter = view.presenter as? FavouritesPresenter
        interactor = presenter.interactor as? FavouritesInteractor
        router = presenter.router as? FavouritesRouter
        
        window.addSubview(view.view)
        window.makeKeyAndVisible()
    }
    
    func test_viewDidLoad_emtpy() throws {
        // Given a emtpy array of favourites
        favouriteRepository.mockFavourites = []
        
        // Given a testing scenario
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then the view is configured
        XCTAssertEqual(view.backgroundImageView.image, ImageAssets.Favourites.logo.image)
        XCTAssertEqual(view.backgroundImageView.alpha, 0.25)
        XCTAssertEqual(view.emptyLabel.style, .title("favourites_empty".localized, .black, .white, .center, true, 0))
    }
    
    func test_viewDidLoad() throws {
        // Given a favourite character
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
        favouriteRepository.mockFavourites = [Favourite(character)]
        
        // Given a testing scenario
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then the view is configured
        XCTAssertEqual(view.backgroundImageView.image, ImageAssets.Favourites.logo.image)
        XCTAssertEqual(view.backgroundImageView.alpha, 0.25)
        
        // Then the list is shown with the favourite character
        let cell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? HomeItemTableViewCell
        XCTAssertEqual(cell?.titleLabel.text, character.displayName)
        XCTAssertEqual(cell?.descriptionLabel.text, character.displayDescription)
    }
    
    func test_didSelectRowAt() throws {
        // Given a favourite character
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
        favouriteRepository.mockFavourites = [Favourite(character)]
        
        // Given a testing scenario
        buildTestingScenario()
        view.loadViewIfNeeded()
        
        // When the user selects the character
        view.tableView(view.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        // Then the user navigates to the character detail
        XCTAssertEqual(coordinator.pushedToCharacterDetailWithID, 1234)
    }
}
