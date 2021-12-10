//
//  LocationViewController.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var location:Location!
    
    @IBOutlet weak var tblResidents: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var dimension: UILabel!
    @IBOutlet weak var created: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.location.residents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        label.text = location.residents[indexPath.row]
        cell.addSubview(label)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = location.name
        self.type.text = location.type
        self.dimension.text = location.dimension
        self.created.text = location.created
        self.tblResidents.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
