//
//  Feed.swift
//  MAF-RSSFeed
//
//  Created by SaikaYamamoto on 2015/09/27.
//  Copyright © 2015年 SaikaYamamoto. All rights reserved.
//

// Framework
import ObjectMapper

/// RSS Feeds Model
class Feed: ResponseBase {
    
    /// url
    private(set) var feedUrl = NSURL()
    
    /// titile
    private(set) var title = ""
    
    /// description
    private(set) var description = ""
   
    /// entries
    private(set) var entries: [Entry] = []
    
    override func mapping(map: Map) {
        feedUrl <- (map["feedUrl"], URLTransform())
        title <- map["title"]
        description <- map["description"]
        entries <- map["entries"]
    }
}

