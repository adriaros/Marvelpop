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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.setupView()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: CharacterDetailHeaderTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: CharacterDetailHeaderTableViewCell.cellType)
        tableView.register(UINib(nibName: CharacterDetailDataTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: CharacterDetailDataTableViewCell.cellType)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
    }
    
    @objc func onFavouriteButton() {
        presenter?.handleFavourite()
    }
}

extension CharacterDetailViewController: CharacterDetailPresenterToViewProtocol {

    func showFavouriteButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: ImageAssets.CharacterDetail.favourite.image, style: .plain, target: self, action: #selector(onFavouriteButton))
    }

    func showNotFavouriteButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: ImageAssets.CharacterDetail.noFavourite.image, style: .plain, target: self, action: #selector(onFavouriteButton))
    }
}
