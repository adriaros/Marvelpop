//
//  AlertControllerProtocol.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

protocol AlertControllerProtocol {
    var root: UIViewController? { get set }
    func show(title: String, description: String, button: String)
}
