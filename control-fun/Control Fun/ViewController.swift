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
            (leftSwitch.hidden, rightSwitch.hidden) = (false, false)
            doSomethingButton.hidden = true
        } else {
            (leftSwitch.hidden, rightSwitch.hidden) = (true, true)
            doSomethingButton.hidden = false
        }
    }
    
    @IBAction func doSomething(sender: UIButton) {
        let controller = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .ActionSheet)
        
        controller.addAction(UIAlertAction(title: "Yes, I'm sure!", style: .Destructive, handler: onYesActionSelected))
        controller.addAction(UIAlertAction(title: "No way!", style: .Cancel, handler: nil))
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        presentViewController(controller, animated: true, completion: nil)
    }
    
    func onYesActionSelected(action: UIAlertAction!) -> Void {
        let controller2 = UIAlertController(title: "Something was done", message: everythingIsOkayMessage(), preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Phew!", style: .Cancel, handler: nil)
        controller2.addAction(cancelAction)
        self.presentViewController(controller2, animated: true, completion: nil)
    }
    
    func everythingIsOkayMessage() -> String {
        let name = self.nameField.text.isEmpty ? "" : "\(self.nameField.text), "
        return "You can breathe easy, \(name)everything went OK."
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
}

