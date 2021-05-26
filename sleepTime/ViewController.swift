//
//  ViewController.swift
//  sleepTime
//
//  Created by Всеволод on 24.05.2021.
//

import UIKit

class ViewController: UIViewController {

    var oneLabel = ""
    let twoLabel = Date()
    let dateFormatter = DateFormatter()
    //словари для хранения времени
    var sleepArr = [1: "", 2: "", 3: "", 4: "", 5: "", 6: ""]
    var sleepArray = [1: "", 2: "", 3: "", 4: "", 5: "", 6: ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //изначально кнопка будет недоступна
            calculateOutlet.isEnabled = false
        //смена цвета цифр в datePicker
            dataPickerOutlet.textColor = .white
        
    }
    
    //функция которая вычисляет время и добавляет в словарь
    func countingTime() {
        
        let endTimeString = dateFormatter.string(from: twoLabel)
        let endTime = dateFormatter.date(from: endTimeString)
        dateFormatter.timeStyle = DateFormatter.Style.short

        sleepArray[6] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                           value: 540,
                                                           endTime: endTime!))
        sleepArray[5] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                           value: 450,
                                                           endTime: endTime!))
        sleepArray[4] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                           value: 360,
                                                           endTime: endTime!))
        sleepArray[3] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                           value: 270,
                                                           endTime: endTime!))
        sleepArray[2] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                           value: 180,
                                                           endTime: endTime!))
        sleepArray[1] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                           value: 90,
                                                           endTime: endTime!))
                
    }
    
    func countTime() {
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        let endTimeString = dateFormatter.date(from: oneLabel)
        
        sleepArr[1] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                         value: -540,
                                                         endTime: endTimeString!))
        sleepArr[2] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                         value: -450,
                                                         endTime: endTimeString!))
        sleepArr[3] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                         value: -360,
                                                         endTime: endTimeString!))
        sleepArr[4] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                         value: -270,
                                                         endTime: endTimeString!))
        sleepArr[5] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                         value: -180,
                                                         endTime: endTimeString!))
        sleepArr[6] = dateFormatter.string(from: getDate(byAdding: .minute,
                                                         value: -90,
                                                         endTime: endTimeString!))
    }
    
    func getDate(byAdding: Calendar.Component, value: Int, endTime: Date) -> Date! {
        let calendar = Calendar.current

        let endDate = calendar.date(byAdding: byAdding, value: value, to: endTime)
        return endDate
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
