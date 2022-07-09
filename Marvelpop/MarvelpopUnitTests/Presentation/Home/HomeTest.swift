//
//  HomeTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
import SnapshotTesting
@testable import Marvelpop

final class HomeTest: XCTestCase {

    private var window: UIWindow!
    private var coordinator: FakeHomeCoordinator!
    private var characterRepository: MockCharactersRepository!
    private var imageLoaderUseCase: MockImageLoader!
    private var alerts: SpyAlertController!
    
    private var view: HomeViewController!
    private var presenter: HomePresenter!
    private var interactor: HomeInteractor!
    private var router: HomeRouter!
    
    private let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil, comics: nil))
    
    override func setUpWithError() throws {
        window = UIWindow()
        alerts = SpyAlertController()
        characterRepository = MockCharactersRepository()
        imageLoaderUseCase = MockImageLoader()
        coordinator = FakeHomeCoordinator()
    }

    override func tearDownWithError() throws {
        window = nil
        coordinator = nil
        characterRepository = nil
        imageLoaderUseCase = nil
        alerts = nil
        view = nil
        presenter = nil
        interactor = nil
        router = nil
    }
    
    private func buildTestingScenario() {
        view = HomeRouter.createModule(coordinator: coordinator, dataProvider: characterRepository, imageLoader: imageLoaderUseCase) as? HomeViewController
        presenter = view.presenter as? HomePresenter
        interactor = presenter.interactor as? HomeInteractor
        router = presenter.router as? HomeRouter
        view.alerts = alerts
        window.addSubview(view.view)
        window.makeKeyAndVisible()
    }
    
    func test_viewDidLoad_error() throws {
        // Given a repository response
        characterRepository.characterList = []
        characterRepository.pagination = nil
        characterRepository.error = .api(.serverError)
        
        // Given a testing scenario
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then the view is configured
        XCTAssertEqual(view.backgroundImageView.image, ImageAssets.Home.background.image)
        XCTAssertEqual(view.backgroundImageView.contentMode, .scaleAspectFit)
        XCTAssertEqual(view.resultsLabel.style, .paragraph(String(format: "home_results".localized, ". . ."), .left, true, 1))
        
        // Then an error alert is shown
        XCTAssertTrue(alerts.root is HomeViewController)
        XCTAssertEqual(alerts.alertTitle, "generic_alert_error_title".localized)
        XCTAssertEqual(alerts.alertDescription, "generic_alert_error_description".localized)
        XCTAssertEqual(alerts.alertButton, "generic_alert_error_ok".localized)
    }

    func test_viewDidLoad() throws {
        // Given a repository response
        characterRepository.characterList = [character]
        characterRepository.pagination = Pagination(offset: 0, total: 1, count: 1, limit: 20)
        
        // Given a testing scenario
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then the view is configured
        XCTAssertEqual(view.backgroundImageView.image, ImageAssets.Home.background.image)
        XCTAssertEqual(view.backgroundImageView.contentMode, .scaleAspectFit)
        XCTAssertEqual(view.keywordContainerView.style, .rounded)
        XCTAssertEqual(view.keywordTextField.style, .basic("home_textfield_placeholder".localized))
        XCTAssertEqual(view.keywordTextField.returnKeyType, .search)
        XCTAssertEqual(view.keywordEraserButton.image(for: .normal), ImageAssets.Home.eraser.image)
        XCTAssertEqual(view.separatorView.backgroundColor, .lightGray)
        XCTAssertEqual(view.resultsLabel.style, .paragraph(String(format: "home_results".localized, "1"), .left, true, 1))
        
        // Then the list is shown with the character
        let cell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? CharacterListItemTableViewCell
        XCTAssertEqual(cell?.titleLabel.text, character.displayName)
        XCTAssertEqual(cell?.descriptionLabel.text, character.displayDescription)
    }
    
    func test_bounce() throws {
        // Given a repository response
        characterRepository.characterList = [character]
        characterRepository.pagination = Pagination(offset: 0, total: 1, count: 1, limit: 20)
        
        // Given a testing scenario
        buildTestingScenario()
        view.loadViewIfNeeded()
        
        // When the user bounces the table
        view.bounce(view.refreshControl)
        
        // Then the view is configured
        XCTAssertEqual(view.resultsLabel.style, .paragraph(String(format: "home_results".localized, "1"), .left, true, 1))
        
        // Then the list is shown with the character
        let cell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? CharacterListItemTableViewCell
        XCTAssertEqual(cell?.titleLabel.text, character.displayName)
        XCTAssertEqual(cell?.descriptionLabel.text, character.displayDescription)
    }
    
    func test_didSelectRowAt() throws {
        // Given a repository response
        characterRepository.characterList = [character]
        characterRepository.pagination = Pagination(offset: 0, total: 1, count: 1, limit: 20)
        
        // Given a testing scenario
        buildTestingScenario()
        view.loadViewIfNeeded()
        
        // When the user selects the character
        view.tableView(view.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        // Then the user navigates to the character detail
        XCTAssertEqual(coordinator.pushedToCharacterDetailWithID, 1234)
    }
    
    func test_eraseTextFieldText() throws {
        // Given a repository response
        characterRepository.characterList = [character]
        characterRepository.pagination = Pagination(offset: 0, total: 1, count: 1, limit: 20)
        
        // Given a testing scenario
        buildTestingScenario()
        view.loadViewIfNeeded()
        
        // Given a text in the TextField
        view.keywordTextField.text = "Searching something"
        
        // When the taps on the eraser button
        view.onKeywordEraserButton(view.keywordEraserButton!)
        
        // Then the TextField text is removed
        XCTAssertEqual(view.keywordTextField.text, "")
    }
    
    func test_snapshot_empty() {
        // Given a repository response
        characterRepository.characterList = []
        characterRepository.pagination = Pagination(offset: 0, total: 0, count: 0, limit: 20)

        // Given a testing scenario
        buildTestingScenario()
        view.overrideUserInterfaceStyle = .light
        
        // When the view did load
        view.loadViewIfNeeded()

        // Then the snapshot is correct
        XCTAssertNil(verifySnapshot(matching: view, as: .image(on: .iPhoneX), named: "HomeViewController empty - iPhoneX"))
        XCTAssertNil(verifySnapshot(matching: view, as: .image(on: .iPadMini), named: "HomeViewController empty - iPadMini"))
    }
    
    func test_snapshot_list() {
        // Given a repository response
        characterRepository.characterList = [character]
        characterRepository.pagination = Pagination(offset: 0, total: 1, count: 1, limit: 20)

        // Given a testing scenario
        buildTestingScenario()
        view.overrideUserInterfaceStyle = .light
        
        // When the view did load
        view.loadViewIfNeeded()

        // Then the snapshot is correct
        XCTAssertNil(verifySnapshot(matching: view, as: .image(on: .iPhoneX), named: "HomeViewController list - iPhoneX"))
        XCTAssertNil(verifySnapshot(matching: view, as: .image(on: .iPadMini), named: "HomeViewController list - iPadMini"))
    }
}
