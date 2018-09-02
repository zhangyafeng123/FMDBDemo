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
    提示：数据库开发，程序代码几乎是一致的，区别在 SQL
    开发数据库功能的时候，首先一定要在 navicat 中测试 SQL 的正确性
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
        //打开数据库
        createTable()
    }
    
}

// MARK: - 微博数据操作
extension ZYFSQLiteManager {
    //新增或者修改微博数据，微博数据在刷新的时候，可能会出现重叠
    /**
     思考:从网络加载结束后，返回的是微博的‘字典数组’，每一个字典对应一个完整的微博记录
     - 完整的微博记录中，包含微博的代号
     - 微博记录中，没有‘当前登录的用户代号’
     **/
    func updateStatus(userId: String, array: [[String : Any]])  {
        //1.准备 sql
        /**
         statusId:要保存的微博代号
         userId:当前登录用户的 id
         status:完整微博字典的 json 二进制数据
         **/
        let sql = "INSERT OR REPLACE INTO T_Status (statusId, userId, status) VALUES (?, ?, ?);"
        //2.执行sql
        
    }
    
    
}
// MARK: - 创建数据表以及其他私有方法
private extension ZYFSQLiteManager {
    
    /// 创建数据表
    func createTable()  {
        guard let path = Bundle.main.path(forResource: "status.sql", ofType: nil),
            let sql = try? String(contentsOfFile: path)
        else {
            return
        }
        print(sql)
        //2.执行 sql - FMDB 的内部队列，串行队列，同步执行
        // 可以保证同一时间，只有一个任务操作数据库，从而保证数据库的读写安全!
        // 在执行增删改查的时候，一定不要使用 statements 方法，否则有可能会被注入
        queue.inDatabase { (db) in
            if db.executeStatements(sql) == true {
                print("创表成功")
            } else {
                print("创表失败")
            }
        }
        print("over")
    }
}

























