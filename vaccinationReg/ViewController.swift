//
//  ViewController.swift
//  vaccinationReg
//
//  Created by Sebastian Lopez on 3/25/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var allergicToggle: UISwitch!
    @IBOutlet weak var resultPrint: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var healthCondition: UITextField!
    
    let choices = ["none", "frontline worker", "have cancer", "chronic kidney disease", "down syndrome", "heart conditions", "immunocompromised state", "obesity(BMI>40kg)", "pregnant", "sickle cell disease", "smoker", "liver disease", "diabetes", "asthma", "thalassemia", "dementia", "pulmonary fibrosis"]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        healthCondition.inputView = pickerView
    }
    
    @IBAction func findOut(_ sender: Any) {
        if let nameInput = nameField.text{
            resultPrint.text = "\(nameInput),"
        }
        let myInt = Int(ageField.text!) ?? 0
        if myInt < 18 {
            resultPrint.text! += " you're not eligible for the Moderna vaccine,"
        }else{
            resultPrint.text! += " you're eligible for the Moderna vaccine,"
        }
        if myInt < 16 {
            resultPrint.text! += " you're not eligible for the Pfizer vaccine."
        }else{
            resultPrint.text! += " you're eligible for the Pfizer vaccine."
        }
        if myInt > 75 {
            resultPrint.text! += " Because of age you're on urgent need for the vaccine,"
        }
        if healthCondition.text != "none" {
            resultPrint.text! += "Because of your health or life conditions you need the vaccine as soon as possible,"
        }
        if allergicToggle.isOn {
            resultPrint.text! += " because of possible allergic reactions please consult with your doctor before getting any vaccine,"
        }
        
        resultPrint.text! += " Certain demographics are not eligible or confirmed to get the vaccine. The data used for this app was aquired from the CDC website. Proceed with your own cautions and please weak a mask."
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        healthCondition.text = choices[row]
        healthCondition.resignFirstResponder()
    }
}
