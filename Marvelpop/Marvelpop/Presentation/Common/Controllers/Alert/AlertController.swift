//
//  AlertController.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

struct AlertController: AlertControllerProvider {
    
    weak var root: UIViewController?
    weak var delegate: AlertControllerDelegate?
    
    func show(title: String, description: String, button: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: button, style: .default, handler: nil))
        root?.present(alert, animated: true, completion: nil)
    }
    
    func show(title: String, description: String, action: String, cancel: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: action, style: .destructive, handler: { _ in
            self.delegate?.onDestructiveAction()
        }))
        root?.present(alert, animated: true, completion: nil)
    }
}
