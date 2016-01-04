//
//  ListController.swift
//  MAF-SwiftCompe
//
//  Created by SaikaYamamoto on 2015/09/23.
//  Copyright (c) 2015年 SaikaYamamoto. All rights reserved.
//

// Frameworks
import UIKit
import RxSwift

/// RSS List Controller
class ListController: UIViewController, UITableViewDelegate {
  
    /// Table View
    @IBOutlet private weak var tableView: ListTable!
    
    /// View Model
    private let viewModel = ListViewModel()

    /// Rx破棄用Dispose
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ViewModel
        setupViewModel()
        
        // PullToRefresh
        setupPullRefresh()
        
        // Rx
        bind()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        tableView.removePullToRefresh()
    }
    
    /**
    View Model Setting
    */
    func setupViewModel() {
        tableView.dataSource = viewModel
        // Load
        Progress.show()
        viewModel.reloadData()
    }
    
    /**
     RX bind
     */
    func bind() {
        viewModel.entries.asObservable().filter { x in
            // 初期化の際にsubscribeをさけるためfilter
            // 配列の要素数が0件より多くなったときにsubscribeを実施
            return !x.isEmpty
            }.subscribe(onNext: { [unowned self] x in
                // 更新
                Progress.dismiss()
                self.tableView.reloadData()
                }, onError: { error in
                    // エラー
                    // FIXME: いつかやるかも
                }, onCompleted: { () in
                    // 完了
                }) { () in
                    
            }.addDisposableTo(disposeBag)
    }
    
    /**
    Pull To Refresh Setting
    */
    func setupPullRefresh() {
        tableView.pullToRefresh { [unowned self] () -> Void in
            self.tableView.switchScrollEnable()
            if self.tableView.hasContents() {
                // tableView has contents
                self.viewModel.reloadData()
            }
        }
    }
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as! UINavigationController
        let controller = navigationController.visibleViewController as! DetailController
        controller.url = (viewModel.entries.value[(tableView.indexPathForSelectedRow?.row)!].link)
   }
    
    /**
    Back From Detail
    
    - parameter segue: segue
    */
    @IBAction func unwindFromDetail(segue: UIStoryboardSegue) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
}

