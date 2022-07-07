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
        tableView.register(UINib(nibName: CharacterDetailImageTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: CharacterDetailImageTableViewCell.cellType)
        tableView.register(UINib(nibName: CharacterDetailDataTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: CharacterDetailDataTableViewCell.cellType)
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
    }
}

extension CharacterDetailViewController: CharacterDetailPresenterToViewProtocol {

}

extension CharacterDetailViewController: CharacterDetailImageTableViewCellDelegate {
    
    func onFavourite() {
        presenter?.handleFavourite()
    }
}
