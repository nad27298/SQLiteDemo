//
//  SQLiteDatabase.swift
//  SQLiteDemo
//
//  Created by DaoNA on 3/23/21.
//

import Foundation
import SQLite

class SQLiteDatabase {
    
    static let shared = SQLiteDatabase()
    public let connectionsqlite: Connection?
    public let connectiondb: Connection?
    
    private init() {
        
        // SQLITE
        let sqlliteurl = Bundle.main.url(forResource: "xemboi", withExtension: "sqlite")!
        var newsqliteurl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        newsqliteurl.appendPathComponent("xemboi.sqlite")
        print("FileSQLITE:\("\n")\(newsqliteurl.path)")
        do {
            if !FileManager.default.fileExists(atPath: newsqliteurl.path) {
                try FileManager.default.copyItem(atPath: sqlliteurl.path, toPath: newsqliteurl.path)
            }
        } catch {
            print(error.localizedDescription)
        }
        do {
            connectionsqlite = try Connection(newsqliteurl.path)
        } catch {
            connectionsqlite = nil
            let nserror = error as NSError
            print("Cannot connect to Database. Error is: \(nserror), \(nserror.userInfo)")
        }
        
        // DB
        let dburl = Bundle.main.url(forResource: "boi", withExtension: "db")!
        var newdburl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        newdburl.appendPathComponent("boi.db")
        print("FileDB:\("\n")\(newdburl.path)")
        do {
            if !FileManager.default.fileExists(atPath: newdburl.path) {
                try FileManager.default.copyItem(atPath: dburl.path, toPath: newdburl.path)
            }
        } catch {
            print(error.localizedDescription)
        }
        do {
            connectiondb = try Connection(newdburl.path)
        } catch {
            connectiondb = nil
            let nserror = error as NSError
            print("Cannot connect to Database. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
    
}
