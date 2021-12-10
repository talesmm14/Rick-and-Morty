//
//  CharacterViewController.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import UIKit


class CharacterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblEpisodes: UITableView!
    var character:Character!
    
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var especie: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.character.episode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        label.text = character.episode[indexPath.row]
        cell.addSubview(label)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nome.text = character.name
        self.status.text = character.status
        self.genero.text = character.gender
        self.tipo.text = character.type
        self.especie.text = character.species
        self.tblEpisodes.dataSource = self
        
        let url = URL(string: character.image)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.img.image = UIImage(data: data!)
            }
        }
        
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
