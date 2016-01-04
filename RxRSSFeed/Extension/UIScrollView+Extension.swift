//
//  UIScrollView+Extension.swift
//  MAF-RSSFeed
//
//  Created by yamamotosaika on 2015/10/23.
//  Copyright © 2015年 yamamotosaika. All rights reserved.
//

import UIKit

/// UIScrollView Extension
extension UIScrollView {
    
    /**
    最上部にスクロール到達したか判定
    
    - returns: 到達したか否か
    */
    func reachTop() -> Bool {
        return contentOffset.y <= 0
    }
    
    /**
    最下部にスクロール到達したか判定
    
    - returns: 到達したか否か
    */
    func reachBottom() -> Bool {
        return contentOffset.y >= (contentSize.height - bounds.size.height)
    }

    /**
    最上部からさらに指定した数値分スクロールされているか判定
    
    - parameter length: 余分にスクロールする数値
    
    - returns: スクロールされているか否か
    */
    func isExtraScrolledTop (length: CGFloat) -> Bool {
        return contentOffset.y <= -length
    }
    
    /**
    最下部からさらに指定した数値分スクロールされているか判定
    
    - parameter length: 余分にスクロールする数値
    
    - returns: スクロールされているか否か
    */
    func isExtraScrolledBottom (length: CGFloat) -> Bool {
        return contentOffset.y >= (contentSize.height - bounds.size.height + length)
    }
    
    /**
    スクロール可否を変更
    */
    func switchScrollEnable() {
        scrollEnabled = !scrollEnabled
    }
    
    /**
    Contentがあるか判定
    
    - returns: あるか否か
    */
    func hasContents() -> Bool {
        return contentSize.height > 0
    }
}
