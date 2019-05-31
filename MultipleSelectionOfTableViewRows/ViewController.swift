//
//  ViewController.swift
//  MultipleSelectionOfTableViewRows
//
//  Created by Himanshu Singh on 31/05/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- OUTLETS AND VAIRABLES
    
    @IBOutlet weak var sampleTableView: UITableView!
    var textArray = ["HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY","HEY"]
}

// MARK:- Lifecycle

extension ViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        sampleTableView.setEditing(true, animated: false)
        self.sampleTableView.allowsMultipleSelection = true
        self.sampleTableView.allowsMultipleSelectionDuringEditing = true
        sampleTableView.register(UINib(nibName: "ContentOfTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }


}

//MARK:- TableViewFunctions

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContentOfTableViewCell
        cell.content?.text  = "\(textArray[indexPath.row])"
        return cell
    }
    
    private func tableView(tableView: UITableView,
                           editingStyleForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell.EditingStyle {
            
            return UITableViewCell.EditingStyle.init(rawValue: 3)!
    }
    
}

