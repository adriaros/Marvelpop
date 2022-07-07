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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.updateView()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: HomeItemTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: HomeItemTableViewCell.cellType)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
    }
    
    @objc func onDeleteButton() {
        presenter?.requestDelete()
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
