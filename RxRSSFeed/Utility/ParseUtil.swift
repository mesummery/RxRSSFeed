//
//  ParseUtil.swift
//  MAF-RSSFeed
//
//  Created by SaikaYamamoto on 2015/10/28.
//  Copyright © 2015年 SaikaYamamoto. All rights reserved.
//

import UIKit
import HTMLReader

//// Parse Util
class ParseUtil: NSObject {

    /**
    Authorをtagから取得
    
    - parameter html: html
    
    - returns: Author
    */
    func parseAuthor(html: HTMLDocument) -> String {
        let autorString = html.firstNodeMatchingSelector("p")?.textContent
        guard let author = autorString else {
            return ""
        }
        return author
    }
    
    /**
    Image Urlをtagから取得
    
    - parameter html: html
    
    - returns: Image URL
    */
    func parseImgUrl(html: HTMLDocument) -> NSURL {
        var imgUrl: String?
        // Image
        let imgTags = html.nodesMatchingSelector("img")
        for tag in imgTags {
            imgUrl = tag.attributes?["src"] as? String
        }
        
        guard let url = imgUrl else {
            return NSURL(string: "")!
        }
        return NSURL(string: url)!
    }
}
