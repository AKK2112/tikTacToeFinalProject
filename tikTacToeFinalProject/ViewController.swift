//
//  ViewController.swift
//  tikTacToeFinalProject
//
//  Created by Alec Kinzie on 4/22/22.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var beginPlayingLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        navigationItem.title = "Tik Tac Toe!"
        beginPlayingLabel.text = "Player 1 tap on a space to begin playing"
    }


}

