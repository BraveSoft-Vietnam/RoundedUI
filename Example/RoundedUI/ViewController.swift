//
//  ViewController.swift
//  RoundedUI_Example
//
//  Created by Hien Pham on 6/16/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import RoundedUI

class ViewController: UIViewController {
    @IBOutlet weak var roundedButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func selectedSwitchChanged(_ sender: UISwitch) {
        self.roundedButton.isSelected = sender.isOn
    }
    
    @IBAction func enabledSwitchChanged(_ sender: UISwitch) {
        self.roundedButton.isEnabled = sender.isOn
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
