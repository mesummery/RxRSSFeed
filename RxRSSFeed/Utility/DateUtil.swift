//
//  DateUtil.swift
//  MAF-RSSFeed
//
//  Created by SaikaYamamoto on 2015/10/28.
//  Copyright © 2015年 SaikaYamamoto. All rights reserved.
//

import UIKit

/// Date Util
class DateUtil: NSObject {
    func convertToString(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.stringFromDate(date)
    }
}
