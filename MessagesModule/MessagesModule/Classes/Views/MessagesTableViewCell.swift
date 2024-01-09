//
//  MessagesTableViewCell.swift
//  MessagesModule
//
//  Created by Анастасия Здобнова on 23.11.2023.
//

import Foundation
import UIKit
import SnapKit
import CommonUI

final class MessagesTableViewCell: UITableViewCell {
    
    private let cellView: UIView = {
        let view = UIView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private let bellImageView: UIImageView = .init(
        image: AppImage.bell.uiImage
    )

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0 
        label.textColor = AppColor.secondaryGray.uiColor
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(subtitleLabel)
        cellView.addSubview(bellImageView)

        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        
        cellView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview().inset(5)
        }
        
        bellImageView.snp.makeConstraints {
            $0.top.bottom.equalTo(cellView).inset(20)
            $0.left.equalTo(cellView).offset(16)
            $0.width.equalTo(32)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(cellView).offset(14)
            $0.left.equalTo(bellImageView.snp.right).offset(36)
        }

        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.left.equalTo(titleLabel)
        }
    }

    func configure(withTitle title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
