//
//  NotitficationViewController.swift
//  qpia-ios
//
//  Created by Nariman on 12.10.2023.
//

import UIKit
import CommonUI
import BottomSheet

final class NotificationViewController: BottomSheetViewController {
    var presenter: NotificationPresenterProtocol?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.text = "Network Error"
        label.textAlignment = .center
        return label
    }()
    
    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "Network Error"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let phoneImageView: UIImageView = .init(image: AppImage.phoneWithLine.uiImage)
    
    private lazy var laterButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(AppColor.latterButtonColor.uiColor, for: .normal)
        button.setTitle("Настроить позже", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        return button
    }()
    
    private let approveButton: ReusableButton = .init(buttonTitle: "Включить уведомления")
    
    private lazy var contentView: UIView = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .clear
        approveButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        approveButton.layer.shadowRadius = 0
        approveButton.addTarget(
            self,
            action: #selector(aproveButtonTapped),
            for: .touchUpInside
        )
        
        laterButton.addTarget(
            self,
            action: #selector(laterButtonTapped),
            for: .touchUpInside
        )
        
        contentView.add(
            titleLabel,
            bodyLabel,
            phoneImageView,
            laterButton,
            approveButton
        )
        
        self.setContent(content: contentView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        bodyLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        phoneImageView.snp.makeConstraints {
            $0.top.equalTo(bodyLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        laterButton.snp.makeConstraints {
            $0.top.equalTo(phoneImageView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        approveButton.snp.makeConstraints {
            $0.top.equalTo(laterButton.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
}

extension NotificationViewController: NotificationViewProtocol {
    
    func updateNotificationView(title: String, bodyText: String) {
        configure(
            title: title,
            bodyText: bodyText
        )
    }
    
    func configure(
        title: String,
        bodyText: String
    ) {
        titleLabel.text = title
        bodyLabel.text = bodyText
    }
}

private extension NotificationViewController {
    @objc
    func aproveButtonTapped() {
        presenter?.aproveButtonTapped()
    }
    
    @objc 
    func laterButtonTapped() {
        presenter?.laterButtonTapped()
    }
}
