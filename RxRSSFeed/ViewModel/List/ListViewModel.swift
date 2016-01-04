//
//  ListViewModel.swift
//  MAF-SwiftCompe
//
//  Created by SaikaYamamoto on 2015/09/23.
//  Copyright (c) 2015年 SaikaYamamoto. All rights reserved.
//

// Frameworks
import UIKit
import RxSwift

/// List View Model
class ListViewModel: NSObject, UITableViewDataSource {

    /// Cell Identifier
    private var cellIdentifier = "ListCell"

    /// Request class
    private var request = FeedRequest()
    
    /// Feed
    private(set) var feed: Variable<Feed?> = Variable(nil)

    /// Entry
    private(set) var entries: Variable<[Entry]> = Variable([])

    /// Error
    private(set) var error: Variable<NSError?> = Variable(nil)

    override init() {
        super.init()
    }
    
    /**
    Reload
    */
    func reloadData() {
        request.get().subscribe(onNext: { [weak self] x in
            self?.entries.value = x.feed.entries
            }, onError: { error in
                
            }, onCompleted: { () in
                
            }) { () in
                
        }.addDisposableTo(request.disposeBag)
    }
    
    // MARK: - TableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.value.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath) as! ListCell
        cell.configureCell(entity: entries.value[indexPath.row])
        return cell
    }
}
