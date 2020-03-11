//
//  ChangeDateViewController.swift
//  Homepwner
//
//  Created by Riley, Kyle M on 3/11/20.
//  Copyright © 2020 Riley, Kyle M. All rights reserved.
//

import UIKit

class ChangeDateViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var item: Item!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Change Date"
        datePicker.date = item.dateCreated
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        item.dateCreated = datePicker.date
    }
}
