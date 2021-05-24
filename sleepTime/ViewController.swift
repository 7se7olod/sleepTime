//
//  ViewController.swift
//  sleepTime
//
//  Created by Всеволод on 24.05.2021.
//

import UIKit

class ViewController: UIViewController {

    var oneLabel = ""
    
    var sleepOne = ""
    var sleepTwo = ""
    var sleepThree = ""
    var sleepFour = ""
    var sleepFive = ""
    var sleepSix = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
            calculateOutlet.isEnabled = false
        
    }

    @IBOutlet var wakeUpTo: UILabel!
    
    @IBAction func dataPicker(_ sender: UIDatePicker) {
        
        let pickerDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        oneLabel = dateFormatter.string(from: pickerDate)
        wakeUpTo.text = "Хочу проснуться в \(oneLabel)"
        calculateOutlet.isEnabled = true
       
        
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "calculateTime" else { return }
        guard let destination = segue.destination as? TimeViewController else { return }
        destination.oneButton = sleepOne
    destination.twoButton = sleepTwo
    destination.threeButton = sleepThree
    destination.fourButton = sleepFour
    destination.fiveButton = sleepFive
    destination.sixButton = sleepSix
        
    }

    @IBOutlet var calculateOutlet: UIButton!
    
    @IBAction func calculate(_ sender: UIButton) {
        
        let pickerDate = oneLabel
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        let endTimeString = dateFormatter.date(from: pickerDate)
        let calendar = Calendar.current
        
        let endDate1 = calendar.date(byAdding: .hour,
                                     value: -9,
                                     to: endTimeString!)
        let endDate2 = calendar.date(byAdding: .minute,
                                     value: -450,
                                     to: endTimeString!)
        let endDate3 = calendar.date(byAdding: .minute,
                                     value: -360,
                                     to: endTimeString!)
        let endDate4 = calendar.date(byAdding: .minute,
                                     value: -270,
                                     to: endTimeString!)
        let endDate5 = calendar.date(byAdding: .minute,
                                     value: -180, to:
                                        endTimeString!)
        let endDate6 = calendar.date(byAdding: .minute,
                                     value: -90,
                                     to: endTimeString!)
        
        sleepOne = dateFormatter.string(from: endDate1!)
        sleepTwo = dateFormatter.string(from: endDate2!)
        sleepThree = dateFormatter.string(from: endDate3!)
        sleepFour = dateFormatter.string(from: endDate4!)
        sleepFive = dateFormatter.string(from: endDate5!)
        sleepSix = dateFormatter.string(from: endDate6!)
        
        
        
    }
    @IBAction func sleepNow(_ sender: UIButton) {
    }
    
    

}

