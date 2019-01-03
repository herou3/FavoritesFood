//
//  FoodCell.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit
import SnapKit

class FoodCell: DefaultCell {
    
    // MARK: - Init/ Deintit
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create UIElements for cell
    private var foodImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dish-image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var foodTitle: UILabel = {
        let title: UILabel = UILabel()
        title.textColor = .mostlyBlackPink
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 20)
        title.numberOfLines = 1
        return title
    }()
    
    private var foodDecriptionTitle: UILabel = {
        let decriptionTitle: UILabel = UILabel()
        decriptionTitle.textColor = .veryDarkPink
        decriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        decriptionTitle.font = UIFont.systemFont(ofSize: 14)
        decriptionTitle.numberOfLines = 2
        return decriptionTitle
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkModeratePink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Configure food cell
    private func addFoodImageView() {
        addSubview(foodImageView)
        foodImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(Constant.imageSizeValue)
        }
    }

    private func addTitleFood() {
        addSubview(foodTitle)
        foodTitle.snp.makeConstraints { (make) in
            make.top.equalTo(foodImageView.snp.bottom).offset(Constant.offsetValue / 2)
            make.left.equalTo(self).offset(Constant.offsetValue)
            make.width.equalTo((self.frame.width / 2) - 2 * Constant.offsetValue)
            make.height.equalTo(Constant.offsetValue * 2)
        }
    }
    
    private func addFoodDecriptionTitle() {
        addSubview(foodDecriptionTitle)
        foodDecriptionTitle.snp.makeConstraints { (make) in
            make.top.equalTo(foodTitle.snp.top)
            make.left.equalTo(foodTitle.snp.right).offset(Constant.offsetValue)
            make.right.equalTo(self.snp.right).offset(-Constant.offsetValue)
            make.height.equalTo(Constant.offsetValue * 2)
        }
    }
    
    private func addLineView() {
        addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(foodTitle.snp.bottom).offset(Constant.offsetValue / 2)
            make.left.right.equalTo(self)
            make.height.equalTo(Constant.offsetValue / 8)
            make.bottom.equalTo(self.snp.bottom)
        }
    }

    override func setupViews() {
        addFoodImageView()
        addTitleFood()
        addFoodDecriptionTitle()
        addLineView()
        self.backgroundColor = .lightGrayishPink
    }
    
    // MARK: - configure data of cell
    func configure(with viewModel: TableCellViewModelProtocool) {
        foodImageView.image = UIImage(data: viewModel.imageData ?? Data())
        foodTitle.text = viewModel.title
        foodDecriptionTitle.text = viewModel.description
    }
}
