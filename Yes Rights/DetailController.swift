//
//  DetailController.swift
//  Yes Rights
//
//  Created by amrit on 2/6/16.
//  Copyright © 2016 Amrit. All rights reserved.
//


import UIKit

class DetailController: UIViewController {
   
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var pdfLoc = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("human", ofType:"pdf")!)
        var request = NSURLRequest(URL: pdfLoc);
        self.webView.loadRequest(request);
        webView.scalesPageToFit = true;
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        
    
        
   

}
