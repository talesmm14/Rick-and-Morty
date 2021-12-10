//
//  LocationsViewController.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import UIKit

class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblLocations: UITableView!
    
    var locations = AllLocations(results: [])
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locations.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:LocationViewCell = tableView.dequeueReusableCell(withIdentifier: "locationIdCell") as! LocationViewCell
        cell.selectionStyle = .none
        cell.nome.text = locations.results[indexPath.row].name
        cell.tipo.text = locations.results[indexPath.row].type
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let locationView:LocationViewController = storyboard?.instantiateViewController(identifier: "locationIdController") as! LocationViewController
        let location = locations.results[indexPath.row]
        
        locationView.location = location
        
        self.navigationController?.pushViewController(locationView, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Locations"
        tblLocations.delegate = self
        tblLocations.dataSource = self
        let service = Service(baseUrl: "https://rickandmortyapi.com/api/")
        
        service.getAllLocations(endPoint: "location")
        
        service.completionAllLocationHandler { [weak self] (response, status, message) in
                    if status {
                        guard let self = self else {return}
                        guard let _response = response else {return}
                        self.locations = _response
                        self.tblLocations.reloadData()
                    }
                }
        // Do any additional setup after loading the view.
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
