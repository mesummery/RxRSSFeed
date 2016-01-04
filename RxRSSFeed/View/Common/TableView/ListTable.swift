//
//  ListTable.swift
//  MAF-RSSFeed
//
//  Created by SaikaYamamoto on 2015/10/31.
//  Copyright © 2015年 SaikaYamamoto. All rights reserved.
//

// Frameworks
import UIKit
// Pull Refresh
import DGElasticPullToRefresh

//// List Table View
class ListTable: UITableView {
    
    /// LoadView
    let loadView = DGElasticPullToRefreshLoadingViewCircle()
    
    override func awakeFromNib() {
        loadView.tintColor = UIColor.whiteColor()
        dg_setPullToRefreshFillColor(THEME_COLOR)
        dg_setPullToRefreshBackgroundColor(backgroundColor!)
    }
    
    /**
    Elastic Pull Refresh
    
    - parameter callback: callback
    */
    func pullToRefresh(callback: () -> Void) -> Void {
        dg_addPullToRefreshWithActionHandler({
            callback()
            
            }, loadingView: loadView)
    }
    
    /**
    Stop Refreshing
    */
    func endRefreshing() {
        dg_stopLoading()
    }
    
    /**
    remove 
    */
    func removePullToRefresh() {
        dg_removePullToRefresh()
    }
}
