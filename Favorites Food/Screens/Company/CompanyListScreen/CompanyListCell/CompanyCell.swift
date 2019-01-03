//
//  CompanyCell.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 02.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

class CompanyCell: DefaultCell {
    
    // MARK: - Init/ Deintit
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create UIElements for cell
    private var companyImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dish-image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var companyNameTitle: UILabel = {
        let title: UILabel = UILabel()
        title.textColor = .mostlyBlackPink
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 20)
        title.numberOfLines = 1
        return title
    }()
    
    private var companyDecriptionTextView: UITextView = {
        let descriptionTextView: UITextView = UITextView()
        descriptionTextView.textColor = .mostlyBlackPink
        descriptionTextView.backgroundColor = .lightGrayishPink
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.font = UIFont.systemFont(ofSize: 16)
        return descriptionTextView
    }()
    
    private var companyRatingTitle: UILabel = {
        let title: UILabel = UILabel()
        title.textColor = .slightlyDesaturatedPink
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 24)
        title.numberOfLines = 1
        return title
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkModeratePink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Configure food cell
    private func addCompanyImageView() {
        addSubview(companyImageView)
        companyImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(Constant.offsetValue)
            make.left.equalTo(self).offset(Constant.offsetValue)
            make.width.equalTo(Constant.imageSizeValue)
            make.height.equalTo(Constant.imageSizeValue)
        }
    }
    
    private func addCompanyNameTitle() {
        addSubview(companyNameTitle)
        companyNameTitle.snp.makeConstraints { (make) in
            make.top.equalTo(companyImageView.snp.top)
            make.left.equalTo(companyImageView.snp.right).offset(Constant.offsetValue)
            make.right.equalTo(self).offset(-Constant.offsetValue)
            make.height.equalTo(Constant.offsetValue * 2)
        }
    }
    
    private func addCompanyDecriptionTitle() {
        addSubview(companyDecriptionTextView)
        companyDecriptionTextView.snp.makeConstraints { (make) in
            make.top.equalTo(companyNameTitle.snp.bottom).offset(Constant.offsetValue / 2)
            make.left.equalTo(companyNameTitle)
            make.right.equalTo(self).offset(-Constant.offsetValue)
            make.bottom.equalTo(companyImageView.snp.bottom)
        }
    }
    
    private func addCompanyRatingTitle() {
        addSubview(companyRatingTitle)
        companyRatingTitle.snp.makeConstraints { (make) in
            make.top.equalTo(companyImageView.snp.top)
            make.left.equalTo(companyImageView.snp.left)
            make.width.equalTo(Constant.offsetValue * 2)
            make.height.equalTo(Constant.offsetValue * 2)
        }
    }
    
    private func addLineView() {
        addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(companyImageView.snp.bottom).offset(Constant.offsetValue / 2)
            make.left.right.equalTo(self)
            make.height.equalTo(Constant.offsetValue / 8)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    override func setupViews() {
        addCompanyImageView()
        addCompanyNameTitle()
        addCompanyDecriptionTitle()
        addCompanyRatingTitle()
        addLineView()
        self.backgroundColor = .lightGrayishPink
    }
    
    // MARK: - configure data of cell
    func configure(with viewModel: TableCellViewModelProtocool) {
        companyImageView.image = UIImage(data: viewModel.imageData ?? Data())
        companyNameTitle.text = viewModel.title
        companyDecriptionTextView.text = viewModel.description
        companyRatingTitle.text = viewModel.rating
    }
    
}
