//
//  ViewController.swift
//  Yes Rights
//
//  Created by amrit on 2/5/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController,MFMessageComposeViewControllerDelegate {
   
   
    
    @IBAction func sendMessage(sender: AnyObject) {
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = "";
        messageVC.recipients = ["9002"]
        messageVC.messageComposeDelegate = self;
        
        self.presentViewController(messageVC, animated: false, completion: nil)
        
        NSLog("hi")
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        
        
        
        switch (result.rawValue) {
        case MessageComposeResultCancelled.rawValue:
            print("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.rawValue:
            print("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.rawValue:
            print("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break;
        }
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
   
  