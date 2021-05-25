//
//  ViewController.swift
//  sleepTime
//
//  Created by Всеволод on 24.05.2021.
//

import UIKit

class ViewController: UIViewController {

    var oneLabel = ""
    
    let dateFormatter = DateFormatter()
    //словари для хранения времени
    var sleepArr = [1: "", 2: "", 3: "", 4: "", 5: "", 6: ""]
    var sleepArray = [1: "", 2: "", 3: "", 4: "", 5: "", 6: ""]
    
    //функция которая вычисляет время и добавляет в словарь
    func countingTime() {
        let twoLabel = Date()
        let calendar = Calendar.current
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        let endTimeString = dateFormatter.string(from: twoLabel)
        
        let endTime = dateFormatter.date(from: endTimeString)
        
        let endDate1 = calendar.date(byAdding: .hour,
                                     value: 9,
                                     to: endTime!)
        let endDate2 = calendar.date(byAdding: .minute,
                                     value: 450,
                                     to: endTime!)
        let endDate3 = calendar.date(byAdding: .minute,
                                     value: 360,
                                     to: endTime!)
        let endDate4 = calendar.date(byAdding: .minute,
                                     value: 270,
                                     to: endTime!)
        let endDate5 = calendar.date(byAdding: .minute,
                                     value: 180, to:
                                        endTime!)
        let endDate6 = calendar.date(byAdding: .minute,
                                     value: 90,
                                     to: endTime!)

        sleepArray[6] = dateFormatter.string(from: endDate1!)
        sleepArray[5] = dateFormatter.string(from: endDate2!)
        sleepArray[4] = dateFormatter.string(from: endDate3!)
        sleepArray[3] = dateFormatter.string(from: endDate4!)
        sleepArray[2] = dateFormatter.string(from: endDate5!)
        sleepArray[1] = dateFormatter.string(from: endDate6!)
                
    }
    
    func countTime() {
        let pickerDate = oneLabel
        
        
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
        
        sleepArr[1] = dateFormatter.string(from: endDate1!)
        sleepArr[2] = dateFormatter.string(from: endDate2!)
        sleepArr[3] = dateFormatter.string(from: endDate3!)
        sleepArr[4] = dateFormatter.string(from: endDate4!)
        sleepArr[5] = dateFormatter.string(from: endDate5!)
        sleepArr[6] = dateFormatter.string(from: endDate6!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //изначально кнопка будет недоступна
            calculateOutlet.isEnabled = false
        //смена цвета цифр в datePicker
            dataPickerOutlet.textColor = .white
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "calculateTime" {
            
         guard let destination = segue.destination as? TimeViewController else { return }
        
            countTime()
        destination.sleeper[1] = sleepArr[1]!
        destination.sleeper[2] = sleepArr[2]!
        destination.sleeper[3] = sleepArr[3]!
        destination.sleeper[4] = sleepArr[4]!
        destination.sleeper[5] = sleepArr[5]!
        destination.sleeper[6] = sleepArr[6]!
        destination.sleepNeed = "Ложитесь спать в это время:"
        }
        else if segue.identifier == "sleepSegue" {
            
        guard let destinationOne = segue.destination as? TimeViewController else { return }
            countingTime()
            destinationOne.sleeper[1] = sleepArray[1]!
            destinationOne.sleeper[2] = sleepArray[2]!
            destinationOne.sleeper[3] = sleepArray[3]!
            destinationOne.sleeper[4] = sleepArray[4]!
            destinationOne.sleeper[5] = sleepArray[5]!
            destinationOne.sleeper[6] = sleepArray[6]!
            destinationOne.sleepNeed = "Заведите будильник на это время:"
         
        } else {return}
    }


    @IBOutlet var wakeUpTo: UILabel!
    
    @IBOutlet var dataPickerOutlet: UIDatePicker!
    
    @IBAction func dataPicker(_ sender: UIDatePicker) {
        
        let pickerDate = sender.date
        dateFormatter.timeStyle = DateFormatter.Style.short
        oneLabel = dateFormatter.string(from: pickerDate)
        wakeUpTo.text = "Хочу проснуться в \(oneLabel)"
        calculateOutlet.isEnabled = true
    
    }

    @IBOutlet var calculateOutlet: UIButton!
    
    @IBAction func calculate(_ sender: UIButton) {
        }
    @IBAction func sleepNow(_ sender: UIButton) {
    }

}

//расширение для установки цвета datePicker

extension UIDatePicker {

var textColor: UIColor? {
    set {
        setValue(newValue, forKeyPath: "textColor")
    }
    get {
        return value(forKeyPath: "textColor") as? UIColor
    }
  }
}
