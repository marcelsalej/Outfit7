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
  private let errorLabel = UILabel.setupAutoLayout()
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
    placeholderLabel.text = viewModel.inputType.placeholderText.uppercased()
    viewModel.insertedDate.map {
      inputDateTextField.text = $0
      return
    }
    inputDateTextField.placeholder = String(format: "Insert %@", viewModel.inputType.placeholderText)
    switch viewModel.validationStatus {
    case .new, .valid:
      errorLabel.isHidden = true
    case .invalid(let error):
      errorLabel.text = error
      errorLabel.isHidden = false
    }
  }
}
// MARK: - UI setup
private extension InputDateTableViewCell {
  func setupViews() {
    selectionStyle = .none
    setupPlaceholderLabel()
    setupInputDateTextField()
    setupSeparatorView()
    setupErrorLabel()
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
    inputDateTextField.delegate = self
    inputDateTextField.snp.makeConstraints {
      $0.top.equalTo(placeholderLabel.snp.bottom).offset(5)
      $0.leading.trailing.equalToSuperview().inset(15)
    }
  }
  
  func setupSeparatorView() {
    addSubview(separatorView)
    separatorView.backgroundColor = .gray
    separatorView.snp.makeConstraints {
      $0.top.equalTo(inputDateTextField.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalTo(1)
    }
  }
  
  func setupErrorLabel() {
    addSubview(errorLabel)
    errorLabel.textColor = .red
    errorLabel.font = .boldSystemFont(ofSize: 10)
    errorLabel.snp.makeConstraints {
      $0.top.equalTo(separatorView.snp.bottom).offset(5)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.bottom.equalToSuperview().inset(10)
      $0.height.greaterThanOrEqualTo(15)
    }
  }
}

// MARK: - View model
extension InputDateTableViewCell {
  struct ViewModel {
    let inputType: InputType
    let insertedDate: String?
    let validationStatus: ValidationStatusType
  }
}

// MARK: - Action method date picker

extension InputDateTableViewCell: UITextFieldDelegate {
  @objc func didChooseDateInPicker(sender: UIDatePicker) {
    inputDateTextField.text = Configuration.dateFormatter.string(from: sender.date)
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    editingEnded?(textField.text ?? "")
  }
    
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      self.resignFirstResponder()
      return false
  }
}
