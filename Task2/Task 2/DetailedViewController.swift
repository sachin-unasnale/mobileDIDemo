//
//  DetailedViewController.swift
//  Task 2
//
//  Created by Admin on 25/11/17.
//  Copyright © 2017 fis. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet var idLabel: UILabel!
    @IBOutlet var login: UILabel!
    var id: Int!
    var logins: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        idLabel.text = String(format: "%d", id)
        login.text = logins
    }

    @IBAction func backAction(_ sender: AnyObject) {
        let taskVC = storyboard?.instantiateViewController(withIdentifier: "Task") as! TaskViewController
        self.present(taskVC, animated: true, completion: nil)
    }
}
