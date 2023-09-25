//
//  NotificationManager.swift
//  LoveMyCapibara
//
//  Created by Isaias Dimitri on 25/07/23.
//

import Foundation
import UserNotifications


class NotificationManager {
    static let instance = NotificationManager()
    
    func askAuthorization() -> Void {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func scheduleNotification(task: TaskModel) -> Void {
        // conteudo
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default
        if let title = task.title { content.title = title }
        if let description = task.text { content.body = description }
        
        // gatilho
        guard let frequencySchedule = task.frequency?.frequencyComponents else { return }
        guard let rememberAtTime = task.rememberAt?.rememberAt else { return }
        guard let scheduledDate = Calendar.current.date(byAdding: rememberAtTime, to: task.date) else { return }
        
        let dateTrigger = Calendar.current.dateComponents(frequencySchedule.isEmpty ? [.day, .hour, .minute] : frequencySchedule, from: scheduledDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateTrigger, repeats: frequencySchedule.isEmpty ? false : true)
        
        // construindo a notificação
        guard let uuidString = task.id?.uuidString else { return }
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func deleteNotification(_ id: String) -> Void {
        if id != "" {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
        }
    }
    
}
