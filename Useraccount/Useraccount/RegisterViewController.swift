//
//  RegisterViewController.swift
//  Useraccount
//
//  Created by Christoph Hackenberger on 19.02.16.
//  Copyright © 2016 Hackenberger. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var regName: UITextField!
    @IBOutlet var regUsername: UITextField!
    @IBOutlet var regPassword: UITextField!
    
    var response: String!
    let rest = Rest.getInstance()

    
    @IBAction func register(sender: AnyObject) {
        rest.doregister(regName.text!, username: regUsername.text!, password: regPassword.text!, closure: { (rsp: String) -> Void in
            self.response = rsp
            NSOperationQueue.mainQueue().addOperationWithBlock() {
                self.performSegueWithIdentifier("registerSeg", sender: sender)
            }
        })
    }
    
    @IBAction func tapped(sender: UITapGestureRecognizer) {
        self.regName.resignFirstResponder()
        self.regUsername.resignFirstResponder()
        self.regPassword.resignFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "registerSeg") {
            let rv = segue.destinationViewController as! ResponseViewController
            rv.setMessage(self.response)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.register(textField)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.regName.delegate = self
        self.regUsername.delegate = self
        self.regPassword.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
