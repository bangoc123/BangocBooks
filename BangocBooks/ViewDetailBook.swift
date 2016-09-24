//
//  ViewDetailBook.swift
//  BangocBooks
//
//  Created by Ngoc on 9/23/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class ViewDetailBook: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    
    @IBOutlet weak var btn_getCurrentTime: UIButton!
    
    
    var webTitle: String!
    var urlString: String!
    var type: String!
    
    override func viewDidLoad() {
        
        var urlPath = ""
        
        super.viewDidLoad()
        
        self.title = webTitle
        
        self.myActivity.startAnimating()
        
        self.myActivity.hidden = false
        
        switch type {
        case "PDF":
            urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "pdf")!
            btn_getCurrentTime.hidden = true
        case "DOCX":
            urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "docx")!
            btn_getCurrentTime.hidden = true
        case "HTML":
            urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "html")!
        default:
            break
        }
        
        
        let url: NSURL = NSURL.fileURLWithPath(urlPath)
        
        let urlRequest = NSURLRequest(URL: url)
        
        self.webView.loadRequest(urlRequest)
        
        self.webView.scalesPageToFit = true
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        myActivity.hidden = false
        myActivity.startAnimating()
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        myActivity.hidden = true
        myActivity.stopAnimating()
        
        
    }
    
    
    
    @IBAction func action_getCurrentTime(sender: AnyObject) {
        self.webView.stringByEvaluatingJavaScriptFromString("hello();")
    
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
