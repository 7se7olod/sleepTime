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
    
    //массивы для хранения времени
    var sleepArr: [String] = []
    var sleepArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //изначально кнопка будет недоступна
            calculateOutlet.isEnabled = false
        //смена цвета цифр в datePicker
            dataPickerOutlet.textColor = .white
    }
    
    //функция которая вычисляет время и добавляет в массив
    func countingTime() {
        
        dateFormatter.timeStyle = DateFormatter.Style.short

        sleepArray.insert(getDate(byAdding: .minute, value: 540, endTime: twoLabel), at: 0)
        sleepArray.insert(getDate(byAdding: .minute, value: 450, endTime: twoLabel), at: 1)
        sleepArray.insert(getDate(byAdding: .minute, value: 360, endTime: twoLabel), at: 2)
        sleepArray.insert(getDate(byAdding: .minute,value: 270, endTime: twoLabel), at: 3)
        sleepArray.insert(getDate(byAdding: .minute, value: 180, endTime: twoLabel), at: 4)
        sleepArray.insert(getDate(byAdding: .minute, value: 90, endTime: twoLabel), at: 5)
                
    }
    
    func countTime() {
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        let endDateOne = dateFormatter.date(from: oneLabel)
        
        sleepArr.insert(getDate(byAdding: .minute, value: -540, endTime: endDateOne), at: 0)
        sleepArr.insert(getDate(byAdding: .minute, value: -450, endTime: endDateOne!), at: 1)
        sleepArr.insert(getDate(byAdding: .minute, value: -360, endTime: endDateOne!), at: 2)
        sleepArr.insert(getDate(byAdding: .minute, value: -270, endTime: endDateOne!), at: 3)
        sleepArr.insert(getDate(byAdding: .minute, value: -180, endTime: endDateOne!), at: 4)
        sleepArr.insert(getDate(byAdding: .minute, value: -90, endTime: endDateOne!), at: 5)
    }
    
    func getDate(byAdding: Calendar.Component, value: Int, endTime: Date!) -> String {
        let calendar = Calendar.current
        let endDate = calendar.date(byAdding: byAdding, value: value, to: endTime)
        let endDate1 = dateFormatter.string(from: endDate!)
        return endDate1
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "calculateTime" {
            
         guard let destination = segue.destination as? TimeViewController else { return }
        
            countTime()
            destination.sleeper[1] = sleepArr[0]
            destination.sleeper[2] = sleepArr[1]
            destination.sleeper[3] = sleepArr[2]
            destination.sleeper[4] = sleepArr[3]
            destination.sleeper[5] = sleepArr[4]
            destination.sleeper[6] = sleepArr[5]
            destination.sleepNeed = "Ложитесь спать в это время:"
            
        } else if segue.identifier == "sleepSegue" {
            
         guard let destinationOne = segue.destination as? TimeViewController else { return }
            countingTime()
            destinationOne.sleeper[1] = sleepArray[5]
            destinationOne.sleeper[2] = sleepArray[4]
            destinationOne.sleeper[3] = sleepArray[3]
            destinationOne.sleeper[4] = sleepArray[2]
            destinationOne.sleeper[5] = sleepArray[1]
            destinationOne.sleeper[6] = sleepArray[0]
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
