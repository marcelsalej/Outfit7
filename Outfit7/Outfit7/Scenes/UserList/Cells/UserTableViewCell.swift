//
//  UserTableViewCell.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
  private let idLabel = UILabel.setupAutoLayout()
  private let birthdayLabel = UILabel.setupAutoLayout()
  private let nameLabel = UILabel.setupAutoLayout()
  private let salaryLabel = UILabel.setupAutoLayout()
  private let ratingLabel = UILabel.setupAutoLayout()
  
  // MARK: - Init methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Set data
extension UserTableViewCell {
  func setData(_ viewModel: ViewModel) {
    idLabel.text = String(format: "Id: %i", viewModel.id)
    birthdayLabel.text = Configuration.dateFormatter.string(from: viewModel.birthDate)
    nameLabel.text = viewModel.name
    salaryLabel.text = String(format: "Salary %.1f EUR", viewModel.salary)
    ratingLabel.text = String(format: "Rating %.1f", viewModel.rating)
  }
}
// MARK: - UI setup
private extension UserTableViewCell {
  func setupViews() {
    setupIdLabel()
    setupBirthdayLabel()
    setupNameLabel()
    setupSalaryLabel()
    setupRatingLabel()
  }
  
  func setupIdLabel() {
    addSubview(idLabel)
    idLabel.font = UIFont.boldSystemFont(ofSize: 12)
    idLabel.textColor = .darkText
    idLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(5)
      $0.trailing.equalToSuperview().inset(5)
    }
  }
  
  func setupBirthdayLabel() {
    addSubview(birthdayLabel)
    birthdayLabel.font = UIFont.systemFont(ofSize: 12)
    birthdayLabel.textColor = .darkText
    birthdayLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(5)
      $0.trailing.equalTo(idLabel.snp.leading).offset(10)
      $0.top.equalToSuperview().inset(5)
    }
  }
  
  func setupNameLabel() {
    addSubview(nameLabel)
    nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
    nameLabel.textColor = .darkText
    nameLabel.snp.makeConstraints {
      $0.top.equalTo(birthdayLabel.snp.bottom).offset(15)
      $0.leading.equalToSuperview().inset(15)
      $0.trailing.equalToSuperview().inset(15)
    }
  }
  
  func setupSalaryLabel() {
    addSubview(salaryLabel)
    salaryLabel.font = UIFont.systemFont(ofSize: 14)
    salaryLabel.textColor = .systemGray
    salaryLabel.textAlignment = .right
    salaryLabel.snp.makeConstraints {
      $0.top.equalTo(nameLabel.snp.bottom).offset(15)
      $0.leading.equalToSuperview().inset(15)
      $0.trailing.equalToSuperview().inset(15)
    }
  }
  
  func setupRatingLabel() {
    addSubview(ratingLabel)
    ratingLabel.font = UIFont.systemFont(ofSize: 14)
    ratingLabel.textColor = .systemGray
    ratingLabel.textAlignment = .right
    ratingLabel.snp.makeConstraints {
      $0.top.equalTo(salaryLabel.snp.bottom).offset(5)
      $0.leading.trailing.bottom.equalToSuperview().inset(15)
    }
  }
}

// MARK: - ViewModel
extension UserTableViewCell {
  struct ViewModel {
    let id: Int
    let name: String
    let birthDate: Date
    let salary: Double
    let rating: Double
  }
}
