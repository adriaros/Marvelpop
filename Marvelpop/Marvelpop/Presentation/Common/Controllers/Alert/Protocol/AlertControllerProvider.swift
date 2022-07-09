//
//  AlertControllerProvider.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

protocol AlertControllerProvider {
    var root: UIViewController? { get set }
    var delegate: AlertControllerDelegate? { get set }
    func show(title: String, description: String, button: String)
    func show(title: String, description: String, action: String, cancel: String)
}
