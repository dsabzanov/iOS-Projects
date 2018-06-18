//
//  ViewController.swift
//  WarApp
//
//  Created by David Sabzanov on 6/12/18.
//  Copyright © 2018 David Sabzanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dealTapped(_ sender: AnyObject) {
        
        // Generating 2 random numbers
        let leftRandomNumber = arc4random_uniform(13) + 2
        let rightRandomNumber = arc4random_uniform(13) + 2
        
        // Change the imageviews/cards
        leftImageView.image = UIImage(named: "card\(leftRandomNumber)")
        
        rightImageView.image = UIImage(named: "card\(rightRandomNumber)")
        
        // Comparing the random numbers
        if leftRandomNumber > rightRandomNumber {
            // Update score count
            leftScore += 1
            
            // Update label
            leftScoreLabel.text = String(leftScore)
        }
        else if leftRandomNumber < rightRandomNumber {
            // Update score count
            rightScore += 1
            
            // Update label
            rightScoreLabel.text = String(rightScore)
        }
    }

}

