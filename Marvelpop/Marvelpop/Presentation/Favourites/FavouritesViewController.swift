//
//  FavouritesViewController.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    var presenter: FavouritesViewToPresenterProtocol?
    var imageLoader: ImageLoaderUseCaseProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var emptyLabel: DSLabel!
    
    var alerts: AlertControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.updateView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: CharacterListItemTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: CharacterListItemTableViewCell.cellType)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 130
    }
    
    @objc func onDeleteButton() {
        alerts?.root = self
        alerts?.show(title: "favourites_alert_delete_title".localized,
                     description: "favourites_alert_delete_description".localized,
                     action: "favourites_alert_delete_action".localized,
                     cancel: "favourites_alert_delete_cancel".localized)
    }
}

extension FavouritesViewController: FavouritesPresenterToViewProtocol {
    
    func enableTrashButton() {
        guard navigationItem.rightBarButtonItem == nil else { return }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: ImageAssets.Favourites.trash.image, style: .plain, target: self, action: #selector(onDeleteButton))
    }

    func disableTrashButton() {
        navigationItem.rightBarButtonItem = nil
    }
}

extension FavouritesViewController: AlertControllerDelegate {
    
    func onDestructiveAction() {
        presenter?.requestDelete()
    }
}
