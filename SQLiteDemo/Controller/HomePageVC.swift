//
//  HomePageVC.swift
//  SQLiteDemo
//
//  Created by DaoNA on 3/23/21.
//

import UIKit

class HomePageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btn_sqlite(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sqlite = storyboard.instantiateViewController(withIdentifier: FileSQLiteVC.className)
        self.navigationController?.pushViewController(sqlite, animated: true)
    }
    
    @IBAction func btn_db(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let db = storyboard.instantiateViewController(withIdentifier: FileDBVC.className)
        self.navigationController?.pushViewController(db, animated: true)
    }
    
    
}
