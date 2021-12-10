//
//  EpisodeViewCell.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import UIKit

class EpisodeViewCell: UITableViewCell {
    @IBOutlet weak var nome: UILabel!
    
    @IBOutlet weak var criado: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
