//
//  UIColor+Extension.swift
//  MAF-RSSFeed
//
//  Created by SaikaYamamoto on 2015/10/31.
//  Copyright © 2015年 SaikaYamamoto. All rights reserved.
//

import UIKit

// MARK: - UIColor Extension
extension UIColor {
    /**
    HexString -> UIColor
    
    - parameter hexStr: hex
    - parameter alpha:  alpha
    
    - returns: UIColor
    */
    static func colorWithHex (var hexStr : NSString, alpha : CGFloat) -> UIColor {
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.whiteColor();
        }
    }
}
