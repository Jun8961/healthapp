//
//  TimeViewController.swift
//  kanschool
//
//  Created by 島田淳一 on 2020/03/15.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit
import RealmSwift
class TimeViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    var category = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func send(_ sender: UIButton) {
        // 通知の作成
        let notificationContent = UNMutableNotificationContent()
        // 通知のタイトルに画面で入力されたタイトルを設定
        notificationContent.title = createTitle()
        // 通知の本文に画面で入力された本文を設定
        notificationContent.body = text.text!
        // 通知音にデフォルト音声を設定
        notificationContent.sound = .default
        // 通知時間の作成
        var notificationTime = DateComponents()
        let calendar = Calendar.current  // 現在時間を取得
        // 時間の設定
        notificationTime.hour = calendar.component(.hour, from: date.date)
        notificationTime.minute = calendar.component(.minute, from: date.date)
        // 通知に通知時間を設定
        let trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
        let uuid = NSUUID().uuidString
        
        print(uuid)
        let request = UNNotificationRequest(identifier: uuid, content: notificationContent, trigger: trigger)
        // 通知を登録
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        //Realmに登録
        let notification = Notification()
        
        notification.id = uuid
        notification.body = text.text!
        notification.date = date.date
        notification.category = category
        
        // デフォルトRealmを取得する
        let realm = try! Realm()
        
print(Realm.Configuration.defaultConfiguration.fileURL!)
        // Realmの取得はスレッドごとに１度だけ必要になります

        // トランザクションを開始して、オブジェクトをRealmに追加する
        try! realm.write {
          realm.add(notification)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func createTitle() -> String {
        if category == 1 {
            return "protein"
            
        } else if category == 2 {
            return "water"
        } else if category == 3 {
            return "medicine"
        }
        return ""
    }
}
