//
//  NotificationRouter.swift
//  qpia-ios
//
//  Created by Nariman on 12.10.2023.
//

import UIKit
import BottomSheet

public final class NotificationRouter: NotificationWireframeProtocol {
    weak var viewController: UIViewController?
    
    public static func createModule() -> BottomSheetViewController {
        let view = NotificationViewController()
        let interactor = NotificationInteractor()
        let router = NotificationRouter()
        let presenter = NotificationPresenter(
            interface: view,
            interactor: interactor,
            router: router
        )
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    public func closeNotificationModule() {
        viewController?.dismiss(animated: true)
    }
}
