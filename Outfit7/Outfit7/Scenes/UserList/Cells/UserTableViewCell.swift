//
//  UserTableViewCell.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
  
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
    
  }
}
// MARK: - UI setup
private extension UserTableViewCell {
  func setupViews() {
  }
}

// MARK: - ViewModel
extension UserTableViewCell {
  struct ViewModel {
    
  }
}
