//
//  EpisodeViewController.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var episode:Episode!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var episode_code: UILabel!
    @IBOutlet weak var created: UILabel!
    @IBOutlet weak var tblCharacters: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episode.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        label.text = episode.characters[indexPath.row]
        cell.addSubview(label)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = episode.name
        self.airDate.text = episode.air_date
        self.episode_code.text = episode.episode
        self.created.text = episode.created
        self.tblCharacters.dataSource = self
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
