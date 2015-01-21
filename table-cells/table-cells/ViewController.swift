//
//  ViewController.swift
//  table-cells
//
//  Created by TJ Taylor on 1/20/15.
//  Copyright (c) 2015 dugancathal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let cellTableIdentifier = "CellTableIdentifier"
    let computers = [
        ["Name": "Macbook Air", "Color": "Silver"],
        ["Name": "Macbook Pro", "Color": "Silver"],
        ["Name": "iMac", "Color": "Silver"],
        ["Name": "Mac Mini", "Color": "Silver"],
        ["Name": "Mac Pro", "Color": "Black"],
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(NameAndColorCell.self, forCellReuseIdentifier: cellTableIdentifier)
        let nib = UINib(nibName: "NameAndColorCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: cellTableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: -
    // MARK: Table View Data Source Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath) as NameAndColorCell
        let rowData = computers[indexPath.row]
        cell.name = rowData["Name"]!
        cell.color = rowData["Color"]!
        return cell
    }
}

