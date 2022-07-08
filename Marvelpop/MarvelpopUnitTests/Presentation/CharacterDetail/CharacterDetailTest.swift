//
//  CharacterDetailTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
import SnapshotTesting
@testable import Marvelpop

class CharacterDetailTest: XCTestCase {

    var window: UIWindow!
    var characterRepository: MockCharactersRepository!
    var imageLoaderUseCase: MockImageLoaderUseCase!
    var favouriteRepository: MockFavouritesRepository!
    var alerts: SpyAlertController!
    
    var view: CharacterDetailViewController!
    var presenter: CharacterDetailPresenter!
    var interactor: CharacterDetailInteractor!
    var router: CharacterDetailRouter!
    
    static var comicItem = APICharactersResponseModel.Data.Result.Comics.ComicsItem(resourceURI: "", name: "Hulk 2001")
    static var comics = APICharactersResponseModel.Data.Result.Comics(items: [comicItem])
    let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil, comics: comics))
    
    override func setUpWithError() throws {
        window = UIWindow()
        alerts = SpyAlertController()
        favouriteRepository = MockFavouritesRepository()
        characterRepository = MockCharactersRepository()
        imageLoaderUseCase = MockImageLoaderUseCase()
    }

    override func tearDownWithError() throws {
        window = nil
        alerts = nil
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
        view.alerts = alerts
        window.addSubview(view.view)
        window.makeKeyAndVisible()
    }
    
    func test_viewDidLoad_error() throws {
        // Given a testing scenario without character
        characterRepository.character = nil
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then an error alert is shown
        XCTAssertTrue(alerts.root is CharacterDetailViewController)
        XCTAssertEqual(alerts.alertTitle, "generic_alert_error_title".localized)
        XCTAssertEqual(alerts.alertDescription, "generic_alert_error_description".localized)
        XCTAssertEqual(alerts.alertButton, "generic_alert_error_ok".localized)
    }
    
    func test_viewDidLoad() throws {
        // Given a character with image
        imageLoaderUseCase.image = ImageAssets.CharacterDetail.logo.image
        
        // Given a testing scenario
        characterRepository.character = character
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then the view has loaded the table items correctly
        let imageCell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! CharacterDetailHeaderTableViewCell
        XCTAssertEqual(imageCell.characterImageView.image, ImageAssets.CharacterDetail.logo.image)
        
        let dataCell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! CharacterDetailDataTableViewCell
        XCTAssertEqual(dataCell.titleLabel.text, "character_detail_about_title".localized)
        XCTAssertEqual(dataCell.descriptionLabel.text, character.displayDescription)
        
        let comicsCell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 2, section: 0)) as! CharacterDetailComicsTableViewCell
        XCTAssertEqual(comicsCell.titleLabel.text, "character_detail_comics_title".localized)
        XCTAssertEqual(comicsCell.collectionView.numberOfItems(inSection: 0), 1)
    }
    
    func test_onFavourite_save() throws {
        // Given a character with image
        imageLoaderUseCase.image = ImageAssets.CharacterDetail.logo.image
        
        // Given a testing scenario
        characterRepository.character = character
        buildTestingScenario()
        view.loadViewIfNeeded()
        
        // When the user taps on favourite button
        view.onFavouriteButton()
        
        // Then the character is saved as favourite and the navigation bar is updated
        XCTAssertEqual(favouriteRepository.favouriteCharacterSaved, character)
        XCTAssertEqual(view.navigationItem.rightBarButtonItem?.image, ImageAssets.CharacterDetail.noFavourite.image)
    }
    
    func test_onFavourite_delete() throws {
        // Given a character with image
        imageLoaderUseCase.image = ImageAssets.CharacterDetail.logo.image
        
        // Given the character saved as favourite
        favouriteRepository.mockCharacterFavourite = character
        
        // Given a testing scenario
        characterRepository.character = character
        buildTestingScenario()
        view.loadViewIfNeeded()
        
        // When the user taps on favourite button
        view.onFavouriteButton()
        
        // Then the character is deleted as favourite and the navigation bar is updated
        XCTAssertEqual(favouriteRepository.favouriteCharacterDeleted, character)
        XCTAssertEqual(view.navigationItem.rightBarButtonItem?.image, ImageAssets.CharacterDetail.favourite.image)
    }
    
    func test_snapshot_characterDetail() throws {
        // Given a character with image
        imageLoaderUseCase.image = ImageAssets.CharacterDetail.logo.image

        // Given a testing scenario
        characterRepository.character = character
        buildTestingScenario()
        view.overrideUserInterfaceStyle = .light
    
        // When the view did load
        view.loadViewIfNeeded()

        // Then the snapshot is correct
        XCTAssertNil(verifySnapshot(matching: view, as: .image(on: .iPhoneX), named: "CharacterDetailViewController - iPhoneX"))
        XCTAssertNil(verifySnapshot(matching: view, as: .image(on: .iPadMini), named: "CharacterDetailViewController - iPadMini"))
    }
}
