//
//  LoadURL.swift
//  BangocBooks
//
//  Created by Ngoc on 9/24/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class LoadURL: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet weak var tf_input: UITextField!
    
    @IBOutlet weak var webView: UIWebView!

    
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var defaultPath = "http://www."
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var input = tf_input.text
        
        if(input?.lowercaseString.rangeOfString(defaultPath) == nil){
            input = defaultPath + input!
        }
        
        let url = NSURL(string: input!)
        let urlRequest = NSURLRequest(URL: url!)
        
        self.webView.loadRequest(urlRequest)
        
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.myActivity.hidden = false
        self.myActivity.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        tf_input.text = self.webView.request?.URL?.absoluteString
        self.myActivity.stopAnimating()
        self.myActivity.hidden = true
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
