//
//  TimeViewController.swift
//  sleepTime
//
//  Created by Всеволод on 24.05.2021.
//

import UIKit

class TimeViewController: UIViewController {

    var sleeper = [1: "", 2: "", 3: "", 4: "", 5: "", 6: ""]
    var sleepNeed = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        oneTime.text = sleeper[1]
        twoTime.text = sleeper[2]
        threeTime.text = sleeper[3]
        fourTime.text = sleeper[4]
        fiveTime.text = sleeper[5]
        sixTime.text = sleeper[6]
        needSleep.text = sleepNeed
    
    }
    
    @IBOutlet var needSleep: UILabel!
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBOutlet var oneTime: UILabel!
    @IBOutlet var twoTime: UILabel!
    @IBOutlet var threeTime: UILabel!
    @IBOutlet var fourTime: UILabel!
    @IBOutlet var fiveTime: UILabel!
    @IBOutlet var sixTime: UILabel!

}
