//
//  ViewController.swift
//  Useraccount
//
//  Created by Christoph Hackenberger on 19.02.16.
//  Copyright © 2016 Hackenberger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var logUsername: UITextField!
    @IBOutlet var logPassword: UITextField!
    
    @IBOutlet var regName: UITextField!
    @IBOutlet var regUsername: UITextField!
    @IBOutlet var regPassword: UITextField!
    
    @IBAction func login(sender: UIButton) {
        performSegueWithIdentifier("loginSeg", sender: sender)
    }
    
    @IBAction func register(sender: UIButton) {
        performSegueWithIdentifier("registerSeg", sender: sender)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

