//
//  Thread-GuaranteeMainThread.swift
//  Marvelpop
//
//  Created by Adrià Ros on 7/7/22.
//

import Foundation

func guaranteeMainThread(_ work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async(execute: work)
    }
}
