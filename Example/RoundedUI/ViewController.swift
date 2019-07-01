//
//  ViewController.swift
//  RoundedUI_Example
//
//  Created by Hien Pham on 6/16/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import RoundedUI
import PureLayout

class ViewController: UIViewController {
    @IBOutlet weak var roundedButton: RoundedButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var content: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.scrollView.addSubview(self.content)
        self.content.autoPinEdgesToSuperviewEdges()
        self.content.autoMatch(.width, to: .width, of: self.scrollView)
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
