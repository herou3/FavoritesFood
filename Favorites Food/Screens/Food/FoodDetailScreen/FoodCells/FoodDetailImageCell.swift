//
//  FoodDetailImageCell.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 20.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

class FoodDetailImageCell: DefaultCell {
    
    // MARK: - Properties
    private var value: UIImage?
    
    // MARK: - Init table Cell
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create UIElements for cell
    private var foodImageView: UIImageView = {
        var imageView: UIImageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dish-image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .verySoftPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Configure food name cell
    private func addFoodImageView() {
        addSubview(foodImageView)
        foodImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(Constant.offsetValue)
            make.left.equalTo(self).offset(Constant.offsetValue)
            make.right.equalTo(self).offset(-Constant.offsetValue)
            make.height.equalTo(Constant.imageSizeValue * 2)
        }
    }
    
    private func addLineView() {
        addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(foodImageView.snp.bottom).offset(Constant.offsetValue / 2)
            make.left.right.equalTo(self)
            make.height.equalTo(Constant.offsetValue / 8)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    override func setupViews() {
        addFoodImageView()
        addLineView()
    }
    
    // MARK: - configure data of cell
    func configure(with viewModel: FoodDetailImageCellViewModel) {
        self.value = UIImage(data: viewModel.value ?? Data())
        self.foodImageView.image = value
    }
}
