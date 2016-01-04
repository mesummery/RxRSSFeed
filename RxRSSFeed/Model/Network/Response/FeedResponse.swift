//
//  FeedResponse.swift
//  MAF-RSSFeed
//
//  Created by yamamotosaika on 2016/01/04.
//  Copyright © 2016年 mafmoff. All rights reserved.
//

// Frameworks
import ObjectMapper

/// Feed Response
class FeedResponse: ResponseBase {
    
    /// Feed
    private(set) var feed: Feed!
    
    override func mapping(map: Map) {
        feed <- map["responseData.feed"]
    }

}
