//
//  MessagesNavBarView.swift
//  abseil
//
//  Created by Анастасия Здобнова on 23.11.2023.
//

import SnapKit
import UIKit

final class MessagesNavBarView: UIView {
    
    private let nameNevBarLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        label.text = "Сообщения"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = UIColor.systemBackground
        addSubview(nameNevBarLabel)
        
        nameNevBarLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

