//
//  NienmenhEntity.swift
//  SQLiteDemo
//
//  Created by DaoNA on 3/23/21.
//

import Foundation
import SQLite
import UIKit

class NienmenhEntity {
    
    static let shared = NienmenhEntity()
    private let tbl = Table("nienmenh")
    
    private let id = Expression<Int>("id")
    private let nguhanh = Expression<String?>("Nguhanh")
    private let nienmenh = Expression<String?>("Nienmenh")
    private let giainghia = Expression<String?>("Giainghia")
    private let nguhanhid = Expression<Int>("NguhanhID")
    
    private init() {
        do {
            if let connection = SQLiteDatabase.shared.connectionsqlite {
                try connection.run(tbl.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(id, primaryKey: true)
                    table.column(nguhanh)
                    table.column(nienmenh)
                    table.column(giainghia)
                    table.column(nguhanhid)
                }))
            }
        } catch {
            print("Cannot create to table Nienmenh, Error is: \(error)")
        }
    }
    
    func getData() -> [NienmenhModel] {
        var listData = [NienmenhModel]()
        do {
            if let listCate = try SQLiteDatabase.shared.connectionsqlite?.prepare(self.tbl) {
                for item in listCate {
                    listData.append(NienmenhModel(id: item[id], nguhanh: item[nguhanh] ?? "", nienmenh: item[nienmenh] ?? "", giainghia: item[giainghia] ?? "", nguhanhid: item[nguhanhid]))
                }
            }
        } catch  {
            print("Cannot get data from table nienmenh, Error is: \(error)")
        }
        return listData
    }
    
}
