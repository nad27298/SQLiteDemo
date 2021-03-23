//
//  FileSQLiteVC.swift
//  SQLiteDemo
//
//  Created by DaoNA on 3/23/21.
//

import UIKit

class FileSQLiteVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblview: UITableView!
    var data = [NienmenhModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = NienmenhEntity.shared.getData()
        tblview.register(UINib(nibName: NienmenhTVC.className, bundle: nil), forCellReuseIdentifier: NienmenhTVC.className)
        tblview.reloadData()
    }
    
    @IBAction func buttonEdit(_ sender: Any) {
        if tblview.isEditing {
            tblview.isEditing = false
        } else {
            tblview.isEditing = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: NienmenhTVC.className) as! NienmenhTVC
        cell.lblID.text = "\(data[indexPath.row].id)"
        cell.lblNguhanh.text = data[indexPath.row].nguhanh
        cell.lblNienmenh.text = data[indexPath.row].nienmenh
        cell.lblGiainghia.text = data[indexPath.row].giainghia
        cell.lblNguhanhID.text = "\(data[indexPath.row].nguhanhid)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
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
