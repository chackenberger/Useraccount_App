//
//  ViewController.swift
//  Useraccount
//
//  Created by Christoph Hackenberger on 19.02.16.
//  Copyright © 2016 Hackenberger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var logUsername: UITextField!
    @IBOutlet var logPassword: UITextField!
    
    var response: String!
    let rest = Rest.getInstance()
    
    @IBAction func login(sender: AnyObject) {
        rest.dologin(logUsername.text!, password: logPassword.text!, closure: { (rsp: String) -> Void in
            self.response = rsp
            NSOperationQueue.mainQueue().addOperationWithBlock() {
                self.performSegueWithIdentifier("loginSeg", sender: sender)
            }
        })
    }
    
    @IBAction func tapped(sender: UITapGestureRecognizer) {
        self.logUsername.resignFirstResponder()
        self.logPassword.resignFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "loginSeg") {
            let rv = segue.destinationViewController as! ResponseViewController
            rv.setMessage(self.response)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.login(textField)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logUsername.delegate = self
        self.logPassword.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

