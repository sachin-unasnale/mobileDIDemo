//
//  ViewController.swift
//  Task 2
//
//  Created by Admin on 25/11/17.
//  Copyright © 2017 fis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userName: UITextField!
    @IBOutlet var passWord: UITextField!
    let user: String = "1234"
    let pass: String = "1234"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userName.placeholder = "Enter User Name"
        passWord.placeholder = "Enter pass word"
    }

    @IBAction func loginButton(_ sender: AnyObject) {
        if userName.text == user && passWord.text == pass {
            let taskVC = storyboard?.instantiateViewController(withIdentifier: "Task") as! TaskViewController
            self.present(taskVC, animated: true, completion: nil)
        }
    }

}

