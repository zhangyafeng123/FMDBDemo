//
//  ZYFSQLiteManager.swift
//  FMDB的使用
//
//  Created by 张亚峰 on 2018/9/2.
//  Copyright © 2018年 zhangyafeng. All rights reserved.
//

import Foundation
import FMDB
/// sqlite单例
/**
    1.数据库的本质上是保存在沙盒中的一个文件，首先需要创建并且打开数据库
    2.创建数据表
    3.增删改查
 **/
class ZYFSQLiteManager {
    
    /// 单例，全局数据库工具访问点
    static let shared = ZYFSQLiteManager()
    
    //数据库队列
    let queue : FMDatabaseQueue
    
    /// 构造函数
    private init() {
        // 数据库的全路径
        let dbName = "status.db"
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        path = (path as NSString).appendingPathComponent(dbName)
        print("数据库的路径" + path)
        //创建数据库队列,同时‘创建或者打开’数据库
        queue = FMDatabaseQueue(path: path)
        
    }
    
}



























