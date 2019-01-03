//
//  FoodDetailNameCell.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 20.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

class FoodDetailNameCell: DefaultCell {
    // MARK: - Properties
    private var value: String?
    
    // MARK: - Init table Cell
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create UIElements for cell
    private var typeCellLabel: UILabel = {
        var label: UILabel = UILabel()
        label.textColor = .mostlyBlackPink
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 1
        label.text = "Food mame:"
        return label
    }()
    
    private var nameLabel: UILabel = {
        var textLabel: UILabel = UILabel()
        textLabel.textColor = .mostlyBlackPink
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = UIFont.systemFont(ofSize: 20)
        return textLabel
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .verySoftPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Configure food name cell
    private func addTypeCellLabel() {
        addSubview(typeCellLabel)
        typeCellLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(Constant.offsetValue)
            make.left.equalTo(self).offset(Constant.offsetValue)
            make.width.equalTo((self.frame.width / 2))
            make.height.equalTo(Constant.imageSizeValue / 3)
        }
    }
    
    private func addNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(typeCellLabel.snp.right)
            make.right.equalTo(self).offset(-Constant.offsetValue)
            make.bottom.equalTo(self)
        }
    }
    
    private func addLineView() {
        addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(typeCellLabel.snp.bottom).offset(Constant.offsetValue / 2)
            make.left.right.equalTo(self)
            make.height.equalTo(Constant.offsetValue / 8)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    override func setupViews() {
        addTypeCellLabel()
        addNameLabel()
        addLineView()
    }
    
    // MARK: - configure data of cell
    func configure(with viewModel: FoodDetailNameCellViewModel) {
        self.value = String(data: viewModel.value ?? Data(), encoding: .utf8)
        self.nameLabel.text = value
    }
}
