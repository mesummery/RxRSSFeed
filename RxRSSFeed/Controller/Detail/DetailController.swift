//
//  DetailController.swift
//  MAF-RSSFeed
//
//  Created by yamamotosaika on 2015/10/28.
//  Copyright © 2015年 SaikaYamamoto. All rights reserved.
//

import UIKit

/// RSS Detail Controller
class DetailController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate {
    
    /// WebView
    @IBOutlet private weak var webView: UIWebView!
    
    /// Back Button
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    /// Go Button
    @IBOutlet weak var goButton: UIBarButtonItem!
    
    /// Url
    var url = NSURL()
    
    /// ScrollBeginOffset
    var scrollBeginOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        loadUrl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
    View構成
    */
    func configureView() {
        webView.scrollView.delegate = self
    }
    
    /**
    WebView Load
    */
    func loadUrl() {
        Progress.show()
        webView.loadRequest(NSURLRequest(URL: url))
    }

    // MARK: WebView Delegate
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        Progress.dismiss()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        switchButtonStatus()
    }
    
    // MARK: ScrollView Delegate
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        scrollBeginOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        navigationController?.setToolbarHidden((scrollBeginOffset < scrollView.contentOffset.y), animated: true)
    }
    
    /**
    Button Status 切替
    */
    func switchButtonStatus() {
        backButton.enabled = webView.canGoBack
        goButton.enabled = webView.canGoForward
    }
}
