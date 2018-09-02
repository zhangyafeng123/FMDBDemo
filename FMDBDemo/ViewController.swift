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
        
        let array: [[String : Any]] = [
            ["idstr" : "101", "text" : "微博-101"],
            ["idstr" : "102", "text" : "微博-102"],
            ["idstr" : "103", "text" : "微博-103"],
            ["idstr" : "104", "text" : "微博-104"],
            ["idstr" : "105", "text" : "微博-105"],
            ["idstr" : "106", "text" : "微博-106"],
            ["idstr" : "107", "text" : "微博-107"],
            ["idstr" : "108", "text" : "微博-108"],
            ["idstr" : "109", "text" : "微博-109"],
        ]
        
        sqlManager.updateStatus(userId: "1", array: array)
        
        // --- 测试查询 ---
        
        let ls = ZYFSQLiteManager.shared.execRecordSet(sql: "select statusId, userId, status from T_Status;")
        print(ls)
    }

   


}

