//
//  FoodListViewController.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit
import SnapKit

class FoodListViewController: UIViewController {
    
    // MARK: - Init/ Deintit
    private var viewModel: TableListViewModelProtocool?
    private let foodCellReuseIdentifier = "cellId"
    private let tableView = UITableView()
    
    // MARK: - Init FoodListViewController
    init(viewModel: FoodListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .lightGrayishPink
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - Configure contact list
    private func configureTableView() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(Constant.offsetValue)
            make.left.right.bottom.equalTo(self.view)
        }
        tableView.backgroundColor = .lightGrayishPink
        tableView.register(FoodCell.self,
                           forCellReuseIdentifier: foodCellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

// MARK: UITableView dataSource
extension FoodListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return viewModel?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows(numberOfRowsInSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: foodCellReuseIdentifier,
                                                       for: indexPath)
            as? FoodCell else { return UITableViewCell(style: .default,
                                                               reuseIdentifier: foodCellReuseIdentifier) }
        guard let cellViewModel = viewModel?.cellViewModel(forIndexPath: indexPath) else { return cell }
        
        cell.configure(with: cellViewModel)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.selectRow(atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return Constant.cellHeight
    }
}
