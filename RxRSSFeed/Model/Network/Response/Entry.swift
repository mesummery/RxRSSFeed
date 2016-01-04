//
//  Entry.swift
//  MAF-RSSFeed
//
//  Created by yamamotosaika on 2016/01/04.
//  Copyright © 2016年 mafmoff. All rights reserved.
//

// Framework
import ObjectMapper

/// RSS FeedsEntry Model
class Entry: ResponseBase {
    
    /// title
    var title = ""

    /// link
    var link = NSURL()
    
    /// piblished date
    var publishedDate = NSDate()
    
    /// content
    var content = ""
    
    override func mapping(map: Map) {
        title <- map["title"]
        link <- (map["link"], URLTransform())
        publishedDate <- (map["publishedDate"], DateTransform())
        content <- map["content"]
    }
}
