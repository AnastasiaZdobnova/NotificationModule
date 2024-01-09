//
//  NotificationProtocols.swift
//  qpia-ios
//
//  Created by Nariman on 12.10.2023.
//

import Foundation

// MARK: Wireframe -

protocol NotificationWireframeProtocol: AnyObject {
    func closeNotificationModule()
}

// MARK: Presenter -

protocol NotificationPresenterProtocol: AnyObject {
    func loadData()
    func aproveButtonTapped()
    func laterButtonTapped()
}

// MARK: Interactor -

protocol NotificationInteractorProtocol: AnyObject {
    var presenter: NotificationPresenterProtocol? { get set }
}

// MARK: View -

protocol NotificationViewProtocol: AnyObject {
    var presenter: NotificationPresenterProtocol? { get set }
    func updateNotificationView(
        title: String,
        bodyText: String
    )
}
