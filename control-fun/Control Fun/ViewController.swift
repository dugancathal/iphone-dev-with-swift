//
//  ViewController.swift
//  Control Fun
//
//  Created by TJ Taylor on 1/18/15.
//  Copyright (c) 2015 dugancathal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "50"
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        let progress = lroundf(sender.value)
        sliderLabel.text = "\(progress)"
    }
    
    @IBAction func switchChanged(sender: UISwitch) {
        let setting = sender.on
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    @IBAction func toggleControlls(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            leftSwitch.hidden = false
            rightSwitch.hidden = false
            doSomethingButton.hidden = true
        } else {
            leftSwitch.hidden = true
            rightSwitch.hidden = true
            doSomethingButton.hidden = false
        }
    }
    
    @IBAction func doSomething(sender: UIButton) {
        let controller = UIAlertController(title: "Are you sure?", message: "This might be dangerous", preferredStyle: .ActionSheet)
        let yesAction = UIAlertAction(title: "Yes, I'm sure!",
            style: .Destructive, handler: { action in
                let name = self.nameField.text.isEmpty ? "" : "\(self.nameField.text), "
                let message = "You can breathe easy, \(name)everything went OK."
                let controller2 = UIAlertController(title: "Something was done", message: message, preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Phew!", style: .Cancel, handler: nil)
                controller2.addAction(cancelAction)
                self.presentViewController(controller2, animated: true, completion: nil)
        })
        let noAction = UIAlertAction(title: "No way!", style: .Cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        presentViewController(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func backgroundTap(sender: UIControl) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
}

