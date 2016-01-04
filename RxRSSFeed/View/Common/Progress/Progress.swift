//
//  Progress.swift
//  MAF-RSSFeed
//
//  Created by SaikaYamamoto on 2015/10/31.
//  Copyright © 2015年 SaikaYamamoto. All rights reserved.
//

// Frameworks
import UIKit
import SVProgressHUD

class Progress: NSObject {

    static func setupProgress() {
        SVProgressHUD.setRingThickness(1.0)
        SVProgressHUD.setForegroundColor(THEME_COLOR)
    }
    
    static func show() {
        setupProgress()
        SVProgressHUD.showWithMaskType(SVProgressHUDMaskType.Clear)
    }
    static func dismiss() {
        setupProgress()
        SVProgressHUD.dismiss()
    }
}
