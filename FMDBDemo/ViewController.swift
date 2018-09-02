//
//  ViewController.swift
//  FMDBDemo
//
//  Created by 张亚峰 on 2018/9/2.
//  Copyright © 2018年 zhangyafeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sqlManager = ZYFSQLiteManager.shared
        
        let array: [[String : Any]] = [["idstr" : "101", "text" : "微博-101"],
                     ["idstr" : "101", "text" : "微博-102"]]
        
        sqlManager.updateStatus(userId: "1", array: array)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

