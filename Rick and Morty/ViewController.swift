//
//  ViewController.swift
//  Rick and Morty
//
//  Created by pat002900 on 18/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func entrar(_ sender: Any) {
        if(true){
            let tabBar = storyboard?.instantiateViewController(identifier: "tabBarId")
            if (tabBar != nil){
                tabBar?.modalPresentationStyle = .fullScreen
                tabBar?.modalTransitionStyle = .flipHorizontal
                self.present(tabBar!, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

