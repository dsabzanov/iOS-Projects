//
//  OnboardingViewController.swift
//  GesturCalc
//
//  Created by David Sabzanov on 8/9/18.
//  Copyright © 2018 David Sabzanov. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let completed = "completed"
    
    @IBAction func letsGoButton(_ sender: UIButton) {
        UserDefaults.standard.set(completed, forKey: "isInitialStart")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
