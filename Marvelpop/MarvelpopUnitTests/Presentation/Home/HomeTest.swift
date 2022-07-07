//
//  HomeTest.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 7/7/22.
//

import XCTest
@testable import Marvelpop

class HomeTest: XCTestCase {

    var window: UIWindow!
    var coordinator: FakeHomeCoordinator!
    var characterRepository: MockCharactersRepository!
    var imageLoaderUseCase: MockImageLoaderUseCase!
    var alerts: SpyAlertController!
    
    var view: HomeViewController!
    var presenter: HomePresenter!
    var interactor: HomeInteractor!
    var router: HomeRouter!
    
    override func setUpWithError() throws {
        window = UIWindow()
        alerts = SpyAlertController()
        characterRepository = MockCharactersRepository()
        imageLoaderUseCase = MockImageLoaderUseCase()
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
        XCTAssertEqual(view.backgroundImageView.image, ImageAssets.Home.logo.image)
        XCTAssertEqual(view.backgroundImageView.alpha, 0.25)
        
        // Then an error alert is shown
        XCTAssertTrue(alerts.root is HomeViewController)
        XCTAssertEqual(alerts.alertTitle, "generic_alert_error_title".localized)
        XCTAssertEqual(alerts.alertDescription, "generic_alert_error_description".localized)
        XCTAssertEqual(alerts.alertButton, "generic_alert_error_ok".localized)
    }

    func test_viewDidLoad() throws {
        // Given a repository response
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
        characterRepository.characterList = [character]
        characterRepository.pagination = Pagination(offset: 0, total: 1, count: 1, limit: 20)
        
        // Given a testing scenario
        buildTestingScenario()
        
        // When the view did load
        view.loadViewIfNeeded()
        
        // Then the view is configured
        XCTAssertEqual(view.backgroundImageView.image, ImageAssets.Home.logo.image)
        XCTAssertEqual(view.backgroundImageView.alpha, 0.25)
        
        // Then the list is shown with the character
        let cell = view.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? HomeItemTableViewCell
        XCTAssertEqual(cell?.titleLabel.text, character.displayName)
        XCTAssertEqual(cell?.descriptionLabel.text, character.displayDescription)
    }
    
    func test_didSelectRowAt() throws {
        // Given a repository response
        let character = Character(APICharactersResponseModel.Data.Result(id: 1234, name: "Hulk", description: "A Green guy", thumbnail: nil))
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
}
