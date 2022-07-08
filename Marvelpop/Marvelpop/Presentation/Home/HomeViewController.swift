//
//  HomeViewController.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomeViewToPresenterProtocol?
    var imageLoader: ImageLoaderUseCaseProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var resultsLabel: DSLabel!
    @IBOutlet weak var separatorView: DSShape!
    @IBOutlet weak var keywordContainerView: DSShape!
    @IBOutlet weak var keywordTextField: DSTextField!
    @IBOutlet weak var keywordEraserButton: UIButton!
    
    var activityIndicator: ActivityIndicatorView?
    var alerts: AlertControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureLoader()
        configureKeywordTextField()
        presenter?.setupView()
        presenter?.updateView(loader: true)
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: CharacterListItemTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: CharacterListItemTableViewCell.cellType)
        tableView.register(UINib(nibName: LoadingTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: LoadingTableViewCell.cellType)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 130
    }
    
    func configureLoader() {
        activityIndicator?.parent = view
    }
    
    func configureKeywordTextField() {
        hideKeyboardWhenTappedAround()
        keywordTextField.delegate = self
    }
    
    @IBAction func onKeywordEraserButton(_ sender: Any) {
        guard let text = keywordTextField.text, !text.isEmpty else { return }
        keywordTextField.text?.removeAll()
        presenter?.updateView(loader: true)
    }
}

extension HomeViewController: HomePresenterToViewProtocol {

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
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presenter?.updateView(loader: true)
        textField.resignFirstResponder()
        view.endEditing(true)
        return true
    }
}
