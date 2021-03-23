//
//  FileDBVC.swift
//  SQLiteDemo
//
//  Created by DaoNA on 3/23/21.
//

import UIKit

class FileDBVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    var data = [BoibaiModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = BoibaiEntiy.shared.getData()
        tblView.register(UINib(nibName: BoibaiTVC.className, bundle: nil), forCellReuseIdentifier: BoibaiTVC.className)
        tblView.reloadData()
    }
    
    @IBAction func buttonEdit(_ sender: Any) {
        if tblView.isEditing {
            tblView.isEditing = false
        } else {
            tblView.isEditing = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoibaiTVC.className) as! BoibaiTVC
        cell.lblcardID.text = "\(data[indexPath.row].cardid)"
        cell.lblcontent.text = data[indexPath.row].content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        data.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    


}
