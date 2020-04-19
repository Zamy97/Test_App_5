//
//  ViewController.swift
//  Test_App_5
//
//  Created by Aktar Zaman on 4/18/20.
//  Copyright © 2020 Aktar Zaman. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
//    var appDelegate = UIApplication.shared.delegate as? AppDelegate
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    @IBAction func scheduleNotification(_ sender: UIButton) {
        let alert = UIAlertController(title: "Lock the phone to hear the notification", message: "The notification will play in 10 secs", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)


        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.delegate = self
        notificationCenter.removeAllDeliveredNotifications()
                
                
        let content = UNMutableNotificationContent()
        content.title = "My name is Zamy"
        content.body = "This is example how to create "
        content.badge = 1
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "confusion"
                

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
        let requestIdentifier = "Local Notification"
                
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
                
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        UNUserNotificationCenter.current().delegate = self
//        // Do any additional setup after loading the view, typically from a nib.
//    }
    
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
    // some other way of handling notification
    completionHandler([.alert, .sound])
    }
    // I am really confused about this thing and i need help understanding these two functions,
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
        print("Will work")
    }

}


