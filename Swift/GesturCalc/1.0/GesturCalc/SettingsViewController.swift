//
//  SettingsViewController.swift
//  GesturCalc
//
//  Created by David Sabzanov on 6/19/18.
//  Copyright © 2018 David Sabzanov. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    @IBOutlet weak var shakeIcon: UIImageView!
    
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
    
    @IBAction func cancelButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func hideOperatorsSwitch(_ sender: UISwitch) {
        
        if sender.isOn == true {
            
        } else {
            
        }
        
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
