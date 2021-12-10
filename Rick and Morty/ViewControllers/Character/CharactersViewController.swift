//
//  CharactersViewController.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import UIKit

class CharactersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblCharacters: UITableView!
    
    var characters = AllCharacter(results: [])
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CharacterViewCell = tableView.dequeueReusableCell(withIdentifier: "characterIdCell") as! CharacterViewCell
        cell.selectionStyle = .none
        cell.name.text = characters.results[indexPath.row].name
        
        let url = URL(string: characters.results[indexPath.row].image)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell.img.image = UIImage(data: data!)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterView:CharacterViewController = storyboard?.instantiateViewController(identifier: "characterIdController") as! CharacterViewController
        let character = characters.results[indexPath.row]
        characterView.character = character
        self.navigationController?.pushViewController(characterView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblCharacters.delegate = self
        tblCharacters.dataSource = self
        self.title = "Characters"
        let service = Service(baseUrl: "https://rickandmortyapi.com/api/")
        service.getAllCharacters(endPoint: "character")
        service.completionAllCharacterHandler { [weak self] (response, status, message) in
                    if status {
                        guard let self = self else {return}
                        guard let _response = response else {return}
                        self.characters = _response
                        print(_response)
                        self.tblCharacters.reloadData()
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
