//
//  Extensions.swift
//  SQLiteDemo
//
//  Created by DaoNA on 3/23/21.
//

import Foundation
import UIKit

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
