//
//  CharacterDetailViewController.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var presenter: CharacterDetailViewToPresenterProtocol?
    var imageLoader: ImageLoaderUseCaseProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    var activityIndicator: ActivityIndicatorView?
    var alerts: AlertControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureLoader()
        presenter?.setupView()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: CharacterDetailHeaderTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: CharacterDetailHeaderTableViewCell.cellType)
        tableView.register(UINib(nibName: CharacterDetailDataTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: CharacterDetailDataTableViewCell.cellType)
        tableView.register(UINib(nibName: CharacterDetailComicsTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: CharacterDetailComicsTableViewCell.cellType)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
    }
    
    func configureLoader() {
        activityIndicator?.parent = view
    }
    
    @objc func onFavouriteButton() {
        presenter?.handleFavourite()
    }
}

extension CharacterDetailViewController: CharacterDetailPresenterToViewProtocol {
    
    func showActivityIndicator() {
        activityIndicator?.start()
    }
    
    func hideActivityIndicator() {
        activityIndicator?.stop()
    }
    
    func showErrorAlert() {
        alerts?.root = self
        alerts?.show(title: "generic_alert_error_title".localized,
                     description: "generic_alert_error_description".localized,
                     button: "generic_alert_error_ok".localized)
    }

    func showFavouriteButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: ImageAssets.CharacterDetail.favourite.image, style: .plain, target: self, action: #selector(onFavouriteButton))
    }

    func showNotFavouriteButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: ImageAssets.CharacterDetail.noFavourite.image, style: .plain, target: self, action: #selector(onFavouriteButton))
    }
}
