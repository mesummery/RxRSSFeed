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
import Alamofire

/// RSS Feeds Request
class FeedRequest: NSObject {

    /// Alamofire Manager
    private let manager = Manager.sharedInstance
    
    /// Alamofire Requestオブジェクト
    private var request: Request?
    
    /// Rx破棄用dispose
    let disposeBag = DisposeBag()
    
    // Host
    private let HOST = GOOGLE_FEED_PATH
    
    // Path
    private let PATH = "http://www.sketchappsources.com/rss.xml&num=100"
    
    override init() {
        super.init()
        createRequest(
            method: .GET,
            host: HOST,
            path: PATH,
            parameters: nil,
            encoding: .JSON,
            headers: nil
        )
    }
    
    /**
    リクエスト生成
    
    - parameter method:     APIメソッド
    - parameter host:       hostname
    - parameter path:       path
    - parameter parameters: param
    - parameter encoding:   encode
    - parameter headers:    header
    */
    func createRequest(
        method method: Alamofire.Method,
        host: String,
        path: String,
        parameters: [String: AnyObject]?,
        encoding: ParameterEncoding,
        headers: [String: String]?) {
            
            request = manager.request(
                Alamofire.Method(rawValue: method.rawValue)!,
                host + path,
                parameters: parameters,
                encoding: encoding,
                headers: headers
            )
    }
    
    /**
    API通信、ObjectMapperでマッピング
    
    - returns: Observableオブジェクト
    */
    func connect() -> Observable<FeedResponse> {
        let observable: Observable<FeedResponse> = Observable.create { (observer: AnyObserver<FeedResponse>) in
            self.request?.responseJSON(completionHandler: { response in
                print("\(response)")
                switch response.result {
                case .Success(let value):
                    guard let object = Mapper<FeedResponse>().map(value) else {
                        return observer.onCompleted()
                    }
                    observer.onNext(object)
                    observer.onCompleted()
                case .Failure(let error):
                    observer.onError(error)
                }
            })
            return AnonymousDisposable {
                
            }
        }
        return observable
    }
}