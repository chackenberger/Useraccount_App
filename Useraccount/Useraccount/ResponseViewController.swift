//
//  ResponseViewController.swift
//  Useraccount
//
//  Created by Christoph Hackenberger on 19.02.16.
//  Copyright © 2016 Hackenberger. All rights reserved.
//

import UIKit

class ResponseViewController: UIViewController {
    
    @IBOutlet var response: UILabel!
    
    var responseMessage: String!
    
    func setMessage(message: String) {
        self.responseMessage = message
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.response.text = self.responseMessage
    }
}