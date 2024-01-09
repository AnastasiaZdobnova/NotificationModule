//
//  NotitficationPresenter.swift
//  qpia-ios
//
//  Created by Nariman on 12.10.2023.
//

import UIKit
import UserNotifications

final class NotificationPresenter: NotificationPresenterProtocol {
    weak private var view: NotificationViewProtocol?
    var interactor: NotificationInteractorProtocol?
    private let router: NotificationWireframeProtocol
    
    init(
        interface: NotificationViewProtocol,
        interactor: NotificationInteractorProtocol?,
        router: NotificationWireframeProtocol
    ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func loadData() {
        let notificationModel = NotificationModel(
            title: "Уведомления, \n которые учат",
            body: "Присылаем слова и фразы на изучение \n без звука и вибрации в течение дня"
        )
        
        view?.updateNotificationView(
            title: notificationModel.title,
            bodyText: notificationModel.body
        )
    }
    
}

extension NotificationPresenter {
    func aproveButtonTapped() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    self.scheduleDailyNotification()
                    self.router.closeNotificationModule()
                } else {
                    self.router.closeNotificationModule()
                }
            }
        }
    }
    
    func laterButtonTapped() {
        router.closeNotificationModule()
    }
    
    private func scheduleDailyNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Привет!"
        content.body = "Время позаниматься"

        var dateComponents = DateComponents()
        dateComponents.hour = 19
        dateComponents.minute = 0

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: "dailyNotification", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Ошибка при создании уведомления: \(error.localizedDescription)")
            } else {
                print("Уведомление успешно запланировано")
            }
        }
    }
}
