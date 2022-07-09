//
//  ActivityIndicatorView.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import UIKit

final class ActivityIndicatorView: UIActivityIndicatorView {
    
    var parent: UIView!
    
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        parent.isUserInteractionEnabled = false
        
        translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(self)
        centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
        
        startAnimating()
    }
    
    func stop() {
        parent.isUserInteractionEnabled = true
        stopAnimating()
    }
}
