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
    private var datStruct = data()

    @IBOutlet var txtViewDisplay: UITextView!
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
                self.txtViewDisplay.text = error.localizedDescription
            }else if let json = json {
                self.txtViewDisplay.text = json.description
                for i in 0..<json.count{
                    if let data = json[i]["id"]  {
                        self.datStruct.id = data as? String
                    }
                    if let data = json[i]["userId"]  {
                        self.datStruct.userId = data as? String
                    }
                    if let data = json[i]["title"]  {
                        self.datStruct.title = data as? String
                    }
                    if let data = json[i]["body"]  {
                        self.datStruct.body = data as? String
                    }
                }
            }
        }
    }
}

