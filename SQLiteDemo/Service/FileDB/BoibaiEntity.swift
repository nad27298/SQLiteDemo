//
//  BoibaiEntity.swift
//  SQLiteDemo
//
//  Created by DaoNA on 3/23/21.
//

import Foundation
import UIKit
import SQLite

class BoibaiEntiy {
    
    static let shared = BoibaiEntiy()
    private let tbl = Table("boibai")
    
    private let cardid = Expression<Int>("cardID")
    private let content = Expression<String>("content")
    
    private init() {
        do {
            if let connection = SQLiteDatabase.shared.connectiondb {
                try connection.run(tbl.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(cardid, primaryKey: true)
                    table.column(content)
                }))
            }
        } catch {
            print("Cannot create to table boibai, error is: \(error)")
        }
    }
    
    func getData() -> [BoibaiModel] {
        var listData = [BoibaiModel]()
        do {
            if let listCate = try SQLiteDatabase.shared.connectiondb?.prepare(self.tbl) {
                for item in listCate {
                    listData.append(BoibaiModel(cardid: item[cardid], content: item[content]))
                }
            }
        } catch {
            print("Cannot get data from table boiboi")
        }
        return listData
    }
    
}
