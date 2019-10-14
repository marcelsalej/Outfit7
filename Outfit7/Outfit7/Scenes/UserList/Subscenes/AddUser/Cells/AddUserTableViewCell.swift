//
//  AddUserTableViewCell.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//
//

import UIKit

class AddUserTableViewCell: UITableViewCell {
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
extension AddUserTableViewCell {
  func setData(_ viewModel: ViewModel) {
  }
}
// MARK: - UI setup
private extension AddUserTableViewCell {
  func setupViews() {
  }
}

// MARK: - View model
extension AddUserTableViewCell {
  struct ViewModel {
    
  }
}
