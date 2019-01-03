//
//  CompanyOfMapView.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 01.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import MapKit
import SnapKit

class CompanyOfMapView: UIView {
    
    // MARK: - Init/Deinit CompanyOfMapView
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create UIElements
    private let nameCompanyLabel: UILabel = {
        var companyLabel: UILabel = UILabel()
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.textColor = UIColor.mostlyBlackPink
        companyLabel.font = UIFont.systemFont(ofSize: 20)
        return companyLabel
    }()
    
    private let addressLabel: UILabel = {
        var addressLabel: UILabel = UILabel()
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.textColor = UIColor.mostlyBlackPink
        addressLabel.font = UIFont.systemFont(ofSize: 14)
        addressLabel.numberOfLines = 2
        return addressLabel
    }()
    
    private let companyImageView: UIImageView = {
        var imageView: UIImageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dish-image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = true
        textView.textColor = UIColor.veryDarkPink
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let difficultyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = UILayoutConstraintAxis.horizontal
        stackView.alignment = UIStackViewAlignment.center
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Configure CompanyOfMapView
    private func addCompanyImageView() {
        addSubview(companyImageView)
        companyImageView.snp.makeConstraints { (make) in
            make.left.top.equalTo(self).offset(Constant.offsetValue)
            make.right.equalTo(self).offset(-((self.frame.width / 2) - Constant.offsetValue))
            make.height.equalTo(Constant.imageSizeValue)
        }
    }
    
    private func addNameCompanyLabel() {
        addSubview(nameCompanyLabel)
        nameCompanyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(Constant.offsetValue)
            make.left.equalTo(companyImageView.snp.right)
            make.right.equalTo(self).offset(-Constant.offsetValue)
            make.height.equalTo(Constant.imageSizeValue / 5)
        }
    }
    
    private func addAddressLabel() {
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameCompanyLabel).offset(Constant.offsetValue / 2)
            make.left.right.equalTo(nameCompanyLabel)
            make.height.equalTo(32)
        }
    }
    
    private func addDescriptionTextView() {
        addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints { (make) in
            make.top.equalTo(addressLabel).offset(Constant.offsetValue / 2)
            make.left.right.equalTo(addressLabel)
            make.bottom.equalTo(addressLabel)
        }
    }
    
    private func addDifficultyStackView() {
        addSubview(difficultyStackView)
        difficultyStackView.snp.makeConstraints { (make) in
            make.top.equalTo(companyImageView).offset(Constant.offsetValue / 2)
            make.left.equalTo(companyImageView)
            make.right.equalTo(descriptionTextView)
            make.height.equalTo(Constant.imageSizeValue / 2)
        }
    }
    
    func setupViews() {
        addCompanyImageView()
        addNameCompanyLabel()
        addAddressLabel()
        addDescriptionTextView()
        addDifficultyStackView()
        self.backgroundColor = .lightGrayishPink
    }
    
    // MARK: - configure data of cell
    func configure(with viewModel: CompanyDetailModelViewProtocol) {
        self.companyImageView.image = UIImage(data: viewModel.companyImage)
        self.nameCompanyLabel.text = viewModel.nameCompany
        self.addressLabel.text = viewModel.location.name
        self.descriptionTextView.text = viewModel.description
    }
}
