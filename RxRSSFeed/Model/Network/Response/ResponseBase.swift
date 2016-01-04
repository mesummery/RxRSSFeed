//
//  ResponseBase.swift
//  MAF-RSSFeed
//
//  Created by yamamotosaika on 2016/01/04.
//  Copyright © 2016年 mafmoff. All rights reserved.
//

// Frameworks
import ObjectMapper

/// Response Base
class ResponseBase: Mappable {
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
    }
}
