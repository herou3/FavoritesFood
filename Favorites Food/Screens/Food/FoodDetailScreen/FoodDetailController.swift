//
//  FoodDetailController.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 20.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

class FoodDetailController: UIViewController {
    
    // MARK: - Properties
    private var foodDetailViewModel: FoodDetailViewModel?
    private var cellNameId = "cellNameId"
    private var cellDecriptionId = "cellDecriptionId"
    private var cellImageId = "cellImageId"
    private var foodDetailTable: UITableView = UITableView()
    
    // MARK: - Init / Deinit
    init(viewModel: FoodDetailViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.bindTo(viewModel)
        configureFoodDetailController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.foodDetailTable.reloadData()
    }
    
    // MARK: - configure foodDetailController
    private func addFoodDetailTable() {
        self.view.addSubview(foodDetailTable)
        foodDetailTable.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.bottom.equalTo(self.view.snp.bottom)
            make.right.equalTo(self.view.snp.right)
        }
        foodDetailTable.dataSource = self
        foodDetailTable.delegate = self
        foodDetailTable.register(FoodDetailNameCell.self, forCellReuseIdentifier: cellNameId)
        foodDetailTable.register(FoodDetailDecriptionCell.self, forCellReuseIdentifier: cellDecriptionId)
        foodDetailTable.register(FoodDetailImageCell.self, forCellReuseIdentifier: cellImageId)
        foodDetailTable.backgroundColor = .lightGrayishPink
        foodDetailTable.tableFooterView = UIView()
    }
    
    private func configureFoodDetailController() {
        addFoodDetailTable()
    }
    
    // MARK: - Bind to viewModel
    private func bindTo(_ viewModel: FoodDetailViewModel) {
        self.foodDetailViewModel = viewModel
    }
    
    // MARK: - get different cells
    func getNameCell(with viewModel: DetailCellViewModelProtocol,
                     and indexPath: IndexPath,
                     in tableView: UITableView) -> UITableViewCell {
        guard let nameCellViewModel = viewModel as? FoodDetailNameCellViewModel else {
            return UITableViewCell()
        }
        
        guard let nameCell = tableView.dequeueReusableCell(withIdentifier: cellNameId, for: indexPath)
            as? FoodDetailNameCell else {
                return UITableViewCell(style: .default, reuseIdentifier: cellNameId)
        }
        nameCell.configure(with: nameCellViewModel)
        return nameCell
    }
    
    func getImageCell(with viewModel: DetailCellViewModelProtocol,
                      and indexPath: IndexPath,
                      in tableView: UITableView) -> UITableViewCell {
        guard let imageCellViewModel = viewModel as? FoodDetailImageCellViewModel else {
            return UITableViewCell()
        }
        guard let imageCell = tableView.dequeueReusableCell(withIdentifier: cellImageId, for: indexPath)
            as? FoodDetailImageCell else {
            return UITableViewCell(style: .default, reuseIdentifier: cellImageId)
        }
        imageCell.configure(with: imageCellViewModel)
        return imageCell
    }
    
    func getDecriptionCell(with viewModel: DetailCellViewModelProtocol,
                           and indexPath: IndexPath,
                           in tableView: UITableView) -> UITableViewCell {
        guard let decriptionCellViewModel = viewModel as? FoodDetailDecriptionCellViewModel else {
            return UITableViewCell()
        }
        guard let decriptionCell = tableView.dequeueReusableCell(withIdentifier: cellDecriptionId, for: indexPath)
            as? FoodDetailDecriptionCell else {
            return UITableViewCell(style: .default, reuseIdentifier: cellDecriptionId)
        }
        decriptionCell.configure(with: decriptionCellViewModel)
        return decriptionCell
    }
}

// MARK: - Extension table data source
extension FoodDetailController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodDetailViewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let detailCellViewModel = foodDetailViewModel?.detailCellViewModel(forIndexPath: indexPath) ??
            FoodDetailNameCellViewModel(with: Data())
        
        switch indexPath.row {
        case CellType.imageCell.rawValue:
            return getImageCell(with: detailCellViewModel, and: indexPath, in: tableView)

        case CellType.nameCell.rawValue:
            return getNameCell(with: detailCellViewModel, and: indexPath, in: tableView)
            
        default:
            return getDecriptionCell(with: detailCellViewModel, and: indexPath, in: tableView)
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return UITableViewAutomaticDimension
//    }
}
