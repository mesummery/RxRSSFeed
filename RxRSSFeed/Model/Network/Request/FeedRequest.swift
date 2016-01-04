//
//  FeedRequest.swift
//  MAF-RSSFeed
//
//  Created by SaikaYamamoto on 2015/10/11.
//  Copyright © 2015年 SaikaYamamoto. All rights reserved.
//

// Frameworks
import RxSwift
import ObjectMapper

/// RSS Feeds Request
class FeedRequest: RequestBase {

    // Host
    private let HOST = GOOGLE_FEED_PATH
    
    // Path
    private let PATH = "http://www.sketchappsources.com/rss.xml&num=100"
    
    override init() {
        super.init()
        super.createRequest(
            method: .GET,
            host: HOST,
            path: PATH,
            parameters: nil,
            encoding: .JSON,
            headers: nil
        )
    }
    
    /**
     get
     
     - returns: Observable
     */
    func get() -> Observable<FeedResponse> {
        return Observable.create({ (observer: AnyObserver<FeedResponse>) in
            self.connect().subscribe(onNext: { (x: FeedResponse) in
                observer.onNext(x)
                }, onError: { error in
                    observer.onError(error)
                }, onCompleted: { () in
                    observer.onCompleted()
                }, onDisposed: { () in
                    
            }).addDisposableTo(self.disposeBag)
            return AnonymousDisposable {
            }
        })
        
    }
}