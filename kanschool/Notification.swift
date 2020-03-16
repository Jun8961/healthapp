//
//  Notification.swift
//  kanschool
//
//  Created by 島田淳一 on 2020/03/16.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation
import RealmSwift


class Notification: Object {
    //　通知一つ一つのid
   @objc dynamic var id = ""
//    //通知の名前
//    dynamic var name = ""
    //dateが時間
   @objc dynamic var date = Date()
    //通知の本文
   @objc dynamic var body = ""
    //通知の種類を表す
   @objc dynamic var category = 0
}
