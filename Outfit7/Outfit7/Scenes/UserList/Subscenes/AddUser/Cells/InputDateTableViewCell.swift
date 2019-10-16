//
//  InputDateTableViewCell.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class InputDateTableViewCell: UITableViewCell {
  private let placeholderLabel = UILabel.setupAutoLayout()
  private let inputDateTextField = UITextField.setupAutoLayout()
  private let separatorView = UIView.setupAutoLayout()
  lazy var datePicker: UIDatePicker = {
    let picker = UIDatePicker()
    picker.datePickerMode = .date
    picker.addTarget(self, action: #selector(didChooseDateInPicker), for: .valueChanged)
    return picker
  }()
  
  var editingEnded: ((String) -> Void)?
  
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
extension InputDateTableViewCell {
  func setData(_ viewModel: ViewModel) {
    placeholderLabel.text = viewModel.placeholderText
    viewModel.insertedDate.map {
      inputDateTextField.text = Configuration.dateFormatter.string(from: $0)
      return
    }
    inputDateTextField.text = "DD/MM/YYYY"
  }
}
// MARK: - UI setup
private extension InputDateTableViewCell {
  func setupViews() {
    setupPlaceholderLabel()
    setupInputDateTextField()
    setupSeparatorView()
  }
  
  func setupPlaceholderLabel() {
    addSubview(placeholderLabel)
    placeholderLabel.font = UIFont.boldSystemFont(ofSize: 12)
    placeholderLabel.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview().inset(15)
    }
  }
  
  func setupInputDateTextField() {
    addSubview(inputDateTextField)
    inputDateTextField.inputView = datePicker
    inputDateTextField.snp.makeConstraints {
      $0.top.equalTo(placeholderLabel.snp.bottom).offset(5)
      $0.leading.trailing.equalToSuperview().inset(15)
    }
  }
  
  func setupSeparatorView() {
    addSubview(separatorView)
    separatorView.backgroundColor = .gray
    separatorView.snp.makeConstraints {
      $0.top.equalTo(inputDateTextField.snp.bottom).offset(15)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalTo(1)
      $0.bottom.equalToSuperview()
    }
  }
}

// MARK: - View model
extension InputDateTableViewCell {
  struct ViewModel {
    let placeholderText: String
    let insertedDate: Date?
    let validationStatus: ValidationStatusType
  }
}

// MARK: - Action method date picker

extension InputDateTableViewCell {
  @objc func didChooseDateInPicker(sender: UIDatePicker) {
    inputDateTextField.text = Configuration.dateFormatter.string(from: sender.date)
  }
  
  @objc func didCloseDatePicker() {
    endEditing(true)
   }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    editingEnded?(inputDateTextField.text ?? "")
  }
}
