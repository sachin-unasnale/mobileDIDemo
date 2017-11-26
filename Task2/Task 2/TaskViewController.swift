//
//  TaskViewController.swift
//  Task 2
//
//  Created by Admin on 25/11/17.
//  Copyright © 2017 fis. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    var jsonData: [JsonData] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.title.text = jsonData[indexPath.item].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dtcv = storyboard?.instantiateViewController(withIdentifier: "detailed") as! DetailedViewController
        dtcv.id = jsonData[indexPath.item].id
        dtcv.logins = jsonData[indexPath.item].login
        self.present(dtcv, animated: true, completion: nil)
    }
    func getData() {
        let urlRequest = URLRequest(url: URL(string: "https://api.github.com/repos/crashlytics/secureudid/issues")!)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, responce, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do {
                let fetchData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
                for jsonData in fetchData {
                    let json = JsonData()
                    if let dataFromJson = jsonData as? NSDictionary {
                        if let dataInjson = dataFromJson["user"] as? [String: AnyObject] {
                            if let id = dataInjson["id"] as? Int, let login = dataInjson["login"] as? String {
                                json.id = id
                                json.login = login
                            }
                        }
                        if let title = dataFromJson["title"] as? String {
                            json.title = title
                        }
                        self.jsonData.append(json)
                    }
                    self.table.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    @IBAction func backAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}
