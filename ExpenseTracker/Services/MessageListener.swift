import UserNotifications
import SwiftUI

class MessageListener: NSObject, UNUserNotificationCenterDelegate, ObservableObject {
    @Published var newTransaction: Transaction?

    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        requestNotificationPermission()
    }

    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }

    // Listen for incoming notifications (simulate message reading)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let content = notification.request.content
        if let transaction = MessageParser.parseTransaction(from: content.body) {
            DispatchQueue.main.async {
                self.newTransaction = transaction
            }
        }
        completionHandler([.banner, .sound])
    }
}
