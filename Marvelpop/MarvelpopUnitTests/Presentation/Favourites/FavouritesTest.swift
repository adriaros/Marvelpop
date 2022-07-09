//
//  FavouritesTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
import SnapshotTesting
@testable import Marvelpop

final class FavouritesTest: XCTestCase {

    private var window: UIWindow!
    private var favouriteRepository: MockFavouritesRepository!
    private var imageLoaderUseCase: MockImageLoaderUseCase!
    private var coordinator: FakeFavouritesCoordinator!
    private var alerts: SpyAlertController!
    
    private var view: FavouritesViewController!
    private var presenter: FavouritesPresenter!
    private var interactor: FavouritesInteractor!
    private var router: FavouritesRouter!
    
    private let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil, comics: nil))
    
    override func setUpWithError() throws {
        window = UIWindow()
        favouriteRepository = MockFavouritesRepository()
        imageLoaderUseCase = MockImageLoaderUseCase()
        coordinator = FakeFavouritesCoordinator()
        alerts = SpyAlertController()
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
        alerts = nil
    }
    
    private func buildTestingScenario() {
        view = FavouritesRouter.createModule(coordinator: coordinator, dataProvider: favouriteRepository, imageLoader: imageLoaderUseCase) as? FavouritesViewController
        presenter = view.presenter as? FavouritesPresenter
        interactor = presenter.interactor as? FavouritesInteractor
        router = presenter.router as? FavouritesRouter
        view.alerts = alerts
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
        XCTAssertEqual(view.emptyLabel.style, .title("favourites_empty".localized, .center, true, 0))
        XCTAssertFalse(view.emptyLabel.isHidden)
        
        // Then the trash button is not shown
        XCTAssertEqual(view.navigationItem.rightBarButtonItem, nil)
    }
    
    func test_viewDidLoad() throws {
        // Given a favourite character
        favouriteRepository.mockFavourites = [Favourite(character)]
        
        // Given a testing scenario
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then the view is configured
        XCTAssertEqual(view.backgroundImageView.image, ImageAssets.Favourites.logo.image)
        XCTAssertEqual(view.backgroundImageView.alpha, 0.25)
        XCTAssertTrue(view.emptyLabel.isHidden)
        
        // Then the list is shown with the favourite character
        let cell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? CharacterListItemTableViewCell
        XCTAssertEqual(cell?.titleLabel.text, character.displayName)
        XCTAssertEqual(cell?.descriptionLabel.text, character.displayDescription)
        
        // Then the trash button is shown
        XCTAssertEqual(view.navigationItem.rightBarButtonItem?.image, ImageAssets.Favourites.trash.image)
    }
    
    func test_didSelectRowAt() throws {
        // Given a favourite character
        favouriteRepository.mockFavourites = [Favourite(character)]
        
        // Given a testing scenario
        buildTestingScenario()
        view.loadViewIfNeeded()
        
        // When the user selects the character
        view.tableView(view.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        // Then the user navigates to the character detail
        XCTAssertEqual(coordinator.pushedToCharacterDetailWithID, 1234)
    }
    
    func test_onDeleteButton() throws {
        // Given a favourite character
        favouriteRepository.mockFavourites = [Favourite(character)]
        
        // Given a testing scenario
        buildTestingScenario()
        view.loadViewIfNeeded()
        
        // When the user taps on delete button
        view.onDeleteButton()
        
        // Then the warning alert is shown
        XCTAssertTrue(alerts.root is FavouritesViewController)
        XCTAssertEqual(alerts.alertTitle, "favourites_alert_delete_title".localized)
        XCTAssertEqual(alerts.alertDescription, "favourites_alert_delete_description".localized)
        XCTAssertEqual(alerts.alertActionButton, "favourites_alert_delete_action".localized)
        XCTAssertEqual(alerts.alertCancelButton, "favourites_alert_delete_cancel".localized)
        
        // When the user taps on "delete" button
        view.onDestructiveAction()
        
        // Then the trash button is hidden, the favourites are deleted and the empty label is shown
        XCTAssertEqual(view.navigationItem.rightBarButtonItem?.image, nil)
        XCTAssertTrue(favouriteRepository.deletedAllCalled)
        XCTAssertFalse(view.emptyLabel.isHidden)
    }
    
    func test_snapshot_empty() {
        // Given a emtpy array of favourites
        favouriteRepository.mockFavourites = []
        
        // Given a testing scenario
        buildTestingScenario()
        view.overrideUserInterfaceStyle = .light
        
        // When the view did load
        view.loadViewIfNeeded()

        // Then the snapshot is correct
        XCTAssertNil(verifySnapshot(matching: view, as: .image(on: .iPhoneX), named: "FavouritesViewController empty - iPhoneX"))
        XCTAssertNil(verifySnapshot(matching: view, as: .image(on: .iPadMini), named: "FavouritesViewController empty - iPadMini"))
    }
    
    func test_snapshot_list() {
        // Given a favourite character
        favouriteRepository.mockFavourites = [Favourite(character)]
        
        // Given a testing scenario
        buildTestingScenario()
        view.overrideUserInterfaceStyle = .light
        
        // When the view did load
        view.loadViewIfNeeded()

        // Then the snapshot is correct
        XCTAssertNil(verifySnapshot(matching: view, as: .image(on: .iPhoneX), named: "FavouritesViewController list - iPhoneX"))
        XCTAssertNil(verifySnapshot(matching: view, as: .image(on: .iPadMini), named: "FavouritesViewController list - iPadMini"))
    }
}
