//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by iWizards XI on 03/07/19.
//  Copyright © 2019 iWizards XI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let networkRequest = NetworkRequest()

    @IBOutlet var lblHeader: UILabel!
    @IBOutlet var tblData: UITableView!
    
    var array : [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnExecuteRequest(_ sender: Any) {
        
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        networkRequest.executeURL(urlToExecute) { (json, error) in
            if let error = error {
                print(error)
            }else if let json = json {
                for i in 0..<json.count{
                    self.array.append(json[i])
                }
            }
            self.tblData.reloadData()
        }
        
    }
}


extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResponseDataCell")as! ResponseDataCell
        if let data = self.array[indexPath.row]["id"] as? Int  {
            cell.lblId.text = "\(data)"
        }
        if let data = self.array[indexPath.row]["userId"] as? Int  {
            cell.lblUserId.text = String(data)
        }
        if let data = self.array[indexPath.row]["title"]  {
            cell.lblTitle.text = data as? String
        }
        if let data =  self.array[indexPath.row]["body"]  {
            cell.txtviewBody.text = data as? String
        }
        return cell
    }
}


class ResponseDataCell : UITableViewCell {
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtviewBody: UITextView!
}
