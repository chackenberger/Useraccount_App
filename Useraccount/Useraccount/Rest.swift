//
//  Rest.swift
//  Useraccount
//
//  Created by Christoph Hackenberger on 19.02.16.
//  Copyright © 2016 Hackenberger. All rights reserved.
//

import Foundation

class Rest {
    
    static func dologin(username: String, password: String, closure: (String) -> Void) {
        let configuration = NSURLSessionConfiguration .defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        
        
        let urlString = "http://10.0.100.46:8000/useraccount/login/dologin?username=\(username)&password=\(password)"
        
        //print("get wallet balance url string is \(urlString)")
        //let url = NSURL(string: urlString as String)
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: urlString)
        request.HTTPMethod = "GET"
        request.timeoutInterval = 30
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let dataTask = session.dataTaskWithRequest(request) {
            (let data: NSData?, let response: NSURLResponse?, let error: NSError?) -> Void in
            
            // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? NSHTTPURLResponse, receivedData = data
                else {
                    print("error: not a valid http response")
                    return
            }
            
            switch (httpResponse.statusCode)
            {
            case 200:
                
                let response = NSString (data: receivedData, encoding: NSUTF8StringEncoding)
                print("response is \(response)")
                
                
                do {
                    let rps = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! Dictionary<String, AnyObject>
                    
                    print(rps["status"])
                    
                    if(rps["status"] as! Bool) {
                        closure("Succesfully logged in")
                    }else {
                        closure("Error: \(rps["error_msg"] as! String)")
                    }
                
                    // }
                } catch {
                    print("error serializing JSON: \(error)")
                }
                
                break
            case 400:
                
                break
            default:
                print("wallet GET request got response \(httpResponse.statusCode)")
            }
        }
        dataTask.resume()
    }
}
