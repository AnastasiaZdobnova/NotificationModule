//
//  MessagesViewController.swift
//  Pods
//
//  Created Анастасия Здобнова on 23.11.2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Dastan Makhutov @mchutov
//

import UIKit
import SnapKit
import CommonUI

final class MessagesViewController: UIViewController, MessagesViewProtocol {
    var presenter: MessagesPresenterProtocol?
    private var customNavBarView: MessagesNavBarView = .init()
    private let lineUnderNav: UIView = .init()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.messagesBackgroundColor.uiColor
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = AppColor.messagesBackgroundColor.uiColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MessagesTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        
        if lastRowIndex >= 0 {
            let lastIndexPath = IndexPath(row: lastRowIndex, section: 0)
            tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: false)
        }
    }
}
private extension MessagesViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        lineUnderNav.backgroundColor = AppColor.lineUnderNav.uiColor
        
        view.add(
            customNavBarView,
            lineUnderNav,
            contentView,
            tableView
        )
    }
    
    func setupConstraints() {
        customNavBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-50)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        lineUnderNav.snp.makeConstraints {
            $0.top.equalTo(customNavBarView.snp.bottom)
            $0.left.right.equalTo(customNavBarView)
            $0.height.equalTo(2)
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(lineUnderNav.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.left.right.equalTo(contentView).inset(16)
            $0.bottom.equalTo(contentView)
        }
    }
}

extension MessagesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfMessages() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! MessagesTableViewCell
        cell.configure(withTitle: "Уведомления", subtitle: "Пока нет сообщений")
        cell.contentView.backgroundColor = AppColor.messagesBackgroundColor.uiColor
        return cell
    }
}
