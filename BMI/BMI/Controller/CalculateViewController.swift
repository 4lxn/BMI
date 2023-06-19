//
//  ViewController.swift
//  BMI
//
//  Created by Alan Cervantes on 08/04/23.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var hSlider: UISlider!
    @IBOutlet weak var wSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func hSliderChanged(_ sender: UISlider) {
        var str: String
        print( String(format: "%.2f", sender.value))
        str = String(format: "%.2f", sender.value)
        str.append("m")
        hLabel.text = str
    
    }
    
    
    @IBAction func wSliderChanged(_ sender: UISlider) {
        var str: String
        print( String(format: "%.0f", sender.value))
        str = String(format: "%.0f", sender.value)
        str.append("kg")
        wLabel.text = str
        }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = hSlider.value
        let weight = wSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
        
}

