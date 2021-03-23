//
//  NienmenhModel.swift
//  SQLiteDemo
//
//  Created by DaoNA on 3/23/21.
//

import Foundation

class NienmenhModel {
    
    var id: Int = 0
    var nguhanh: String = ""
    var nienmenh: String = ""
    var giainghia: String = ""
    var nguhanhid: Int = 0
    
    init(id: Int, nguhanh: String, nienmenh: String, giainghia: String, nguhanhid: Int) {
        self.id = id
        self.nguhanh = nguhanh
        self.nienmenh = nienmenh
        self.giainghia = giainghia
        self.nguhanhid = nguhanhid
    }
    
}
