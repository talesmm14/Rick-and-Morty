//
//  EpisodesViewController.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import UIKit

class EpisodesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblEpisodes: UITableView!
    
    var episodes = AllEpisodes(results: [])
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episodes.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:EpisodeViewCell = tableView.dequeueReusableCell(withIdentifier: "episodeIdCell") as! EpisodeViewCell
        cell.selectionStyle = .none
        cell.nome.text = episodes.results[indexPath.row].name
        cell.criado.text = episodes.results[indexPath.row].created

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodeView:EpisodeViewController = storyboard?.instantiateViewController(identifier: "episodeIdController") as! EpisodeViewController
        let episode = episodes.results[indexPath.row]
        
        episodeView.episode = episode
        
        self.navigationController?.pushViewController(episodeView, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblEpisodes.delegate = self
        tblEpisodes.dataSource = self
        self.title = "Episodes"
        let service = Service(baseUrl: "https://rickandmortyapi.com/api/")
        
        service.getAllEpisodes(endPoint: "episode")
        
        service.completionAllEpisodeHandler { [weak self] (response, status, message) in
                    if status {
                        guard let self = self else {return}
                        guard let _response = response else {return}
                        self.episodes = _response
                        self.tblEpisodes.reloadData()
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
