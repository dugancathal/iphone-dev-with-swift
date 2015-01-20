//
//  DoubleComponentPickerViewController.swift
//  pickers
//
//  Created by TJ Taylor on 1/19/15.
//  Copyright (c) 2015 dugancathal. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var doublePicker: UIPickerView!
    private let fillingComponent = 0
    private let breadComponent = 1
    private let fillingTypes = ["Ham", "Turkey", "Peanut butter", "Tuna salad", "Chicken salad", "Roast Beef", "Vegemite"]
    private let breadTypes = ["White", "Wheat", "Rye", "Sourdough", "Seven Grain"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        let fillingRow = doublePicker.selectedRowInComponent(fillingComponent)
        let breadRow = doublePicker.selectedRowInComponent(breadComponent)
        
        let filling = fillingTypes[fillingRow]
        let bread = breadTypes[breadRow]
        
        let title = "Your \(filling) on \(bread) bread will be right out."
        
        let alert = UIAlertController(title: title, message: "Thank you for your order", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Great!", style: .Default, handler: nil)
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: -
    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == breadComponent {
            return breadTypes.count
        } else {
            return fillingTypes.count
        }
    }

    // MARK: -
    // MARK: Picker Delegate Methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == breadComponent {
            return breadTypes[row]
        } else {
            return fillingTypes[row]
        }
    }
}
