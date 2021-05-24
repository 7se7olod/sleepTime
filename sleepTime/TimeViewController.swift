//
//  TimeViewController.swift
//  sleepTime
//
//  Created by Всеволод on 24.05.2021.
//

import UIKit

class TimeViewController: UIViewController {

    var oneButton = ""
    var twoButton = ""
    var threeButton = ""
    var fourButton = ""
    var fiveButton = ""
    var sixButton = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        oneTime.text = oneButton
        twoTime.text = twoButton
        threeTime.text = threeButton
        fourTime.text = fourButton
        fiveTime.text = fiveButton
        sixTime.text = sixButton
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBOutlet var oneTime: UILabel!
    @IBOutlet var twoTime: UILabel!
    @IBOutlet var threeTime: UILabel!
    @IBOutlet var fourTime: UILabel!
    @IBOutlet var fiveTime: UILabel!
    @IBOutlet var sixTime: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
