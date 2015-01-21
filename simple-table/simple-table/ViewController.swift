//
//  ViewController.swift
//  simple-table
//
//  Created by TJ Taylor on 1/20/15.
//  Copyright (c) 2015 dugancathal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let dwarves = [
        "Sleepy", "Sneezy", "Bashful", "Happy", "Doc", "Grumpy", "Dopey",
        "Thorin", "Dorin", "Nori", "Ori", "Balin", "Dwalin", "Fili", "Kili",
        "Oin", "Gloin", "Bifur", "Bofur", "Bombur"
    ]
    let disneyImage = UIImage(named: "star")
    let tolkienImage = UIImage(named: "star2")
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: -
    // MARK: - Table View Data Source Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: simpleTableIdentifier)
        }
        
        if indexPath.row > 7 {
            cell!.imageView!.image = disneyImage
            cell!.detailTextLabel?.text = "Mr. Disney"
        } else {
            cell!.imageView!.image = tolkienImage
            cell!.detailTextLabel?.text = "Mr. Tolkien"
        }
        
        cell!.textLabel!.text = dwarves[indexPath.row]
        return cell!
    }
    
    // MARK: -
    // MARK: Table View Delegate Methods
    
    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.row == 0 {
            return nil
        } else {
            return indexPath
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let alert = UIAlertController(title: "Row selected", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Thanks", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
}

