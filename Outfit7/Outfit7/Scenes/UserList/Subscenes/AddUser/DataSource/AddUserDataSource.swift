//
//  AddUserDataSource.swift
//  Outfit7
//
//  Created by Marcel Salej on 14/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class AddUserDataSource: NSObject, DataSourceProtocol {
  var sections: [AddUserSection] = []
}

// MARK: - Public Methods
extension AddUserDataSource {
  func setData(user: User?) {
    sections.removeAll()
    var rows = [AddUserRow]()
    rows.append(.inputText(.init(inputType: .name,
                                 insertedString: user?.name ?? "",
                                 validationStatus: .new)))
    rows.append(.inputText(.init(inputType: .username,
                                 insertedString: user?.username ?? "",
                                 validationStatus: .new)))
    rows.append(.inputText(.init(inputType: .email,
                                 insertedString: user?.email ?? "",
                                 validationStatus: .new)))
    if let birthDay = user?.birthday {
      rows.append(.inputDate(.init(inputType: .birthdate,
                                   insertedDate: Configuration.dateFormatter.string(from: birthDay),
                                   validationStatus: .new)))
    } else {
      rows.append(.inputDate(.init(inputType: .birthdate,
                                   insertedDate: "",
                                   validationStatus: .new)))
    }
    rows.append(.inputText(.init(inputType: .salary,
                                 insertedString: user?.salary != nil ? String(format: "%.2f",
                                                                              user?.salary ?? "") : "",
                                 validationStatus: .new)))
    rows.append(.inputText(.init(inputType: .rating,
                                 insertedString: user?.rating != nil ? String(format: "%2.f",
                                                                              user?.rating ?? "") : "",
                                 validationStatus: .new)))
    
    sections.append(.form(rows: rows))
  }
}

// MARK: - UITableView DataSource
extension AddUserDataSource: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfRows(in: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let row = section(at: indexPath.section)?.row(at: indexPath.row) else {
      Logger.error("No available row in dataSource at given indexPath \(indexPath)!")
      return UITableViewCell()
    }
    
    switch row {
    case .inputText(let viewModel):
      let cell = tableView.dequeueReusableCell(InputTextTableViewCell.self, at: indexPath)
      cell.setData(viewModel)
      cell.editingEnded = { [weak self] insertedValue in
        self?.sections[safe: 0]?.rows[safe: indexPath.row].map {
          switch $0 {
          case .inputText(let viewModel):
            let validationStatuses = self?.validateType(insertedValue: insertedValue,
                                                        inputType: viewModel.inputType)
            self?.updateViewModel(at: indexPath,
                                  validations: validationStatuses ?? [],
                                  insertedValue: insertedValue)
            tableView.reloadData()
          case .inputDate:
            // cannot happen here
            break
          }
        }
      }
      return cell
    case .inputDate(let viewModel):
      let cell = tableView.dequeueReusableCell(InputDateTableViewCell.self, at: indexPath)
      cell.setData(viewModel)
      cell.editingEnded = { [weak self] insertedValue in
        self?.sections[safe: 0]?.rows[safe: indexPath.row].map {
          switch $0 {
          case .inputText:
            // cannot happen here
            break
          case .inputDate(let viewModel):
            let validationStatuses = self?.validate(inputType: viewModel.inputType,
                                                    insertedValue: insertedValue)
            self?.updateViewModel(at: indexPath,
                                  validations: validationStatuses ?? [],
                                  insertedValue: insertedValue)
            tableView.reloadData()
          }
        }
      }
      return cell
    }
  }
}

// MARK: - Model update

private extension AddUserDataSource {
  func updateViewModel(at indexPath: IndexPath, validations: [ValidationStatusType], insertedValue: String) {
    var rows = [AddUserRow]()
    let failedValidation = validations.first {
      switch $0 {
      case .new:
        return false
      case .valid:
        return false
      case .invalid:
        return true
      }
    }
    _ = sections[safe: 0]?.rows.enumerated().map {
      if indexPath.row == $0.offset {
        switch $0.element {
        case .inputText(let viewModel):
          rows.append(.inputText(.init(inputType: viewModel.inputType,
                                       insertedString: insertedValue,
                                       validationStatus: failedValidation ?? .valid)))
        case .inputDate(let viewModel):
          rows.append(.inputDate(.init(inputType: viewModel.inputType,
                                       insertedDate: insertedValue,
                                       validationStatus: failedValidation ?? .valid)))
        }
      } else {
        rows.append($0.element)
      }
    }
    sections.removeAll()
    sections.append(.form(rows: rows))
  }
}

// MARK: - Validation
extension AddUserDataSource {
  private func validate(inputType: InputType, insertedValue: String) -> [ValidationStatusType] {
    return validateType(insertedValue: insertedValue,
                        inputType: inputType)
  }
  
  private func validateType(insertedValue: String, inputType: InputType) -> [ValidationStatusType] {
    inputType.validations.map {
      switch $0 {
      case .email:
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let emptyMessage = String(format: "%@ is not a valid email!", inputType.placeholderText)
        return emailPred.evaluate(with: insertedValue) ? .valid : .invalid(message: emptyMessage)
      case .empty:
        let emptyMessage = String(format: "%@ is empty!", inputType.placeholderText)
        return insertedValue.isEmpty ? .invalid(message: emptyMessage) : .valid
      }
    }
  }
  
  func validateAll() -> Bool {
    sections[safe: 0]?.rows.enumerated().map {
      switch $0.element {
      case .inputText(let viewModel):
        let validationStatuses = validate(inputType: viewModel.inputType,
                                          insertedValue: viewModel.insertedString)
        updateViewModel(at: IndexPath(row: $0.offset, section: 0),
                        validations: validationStatuses,
                        insertedValue: viewModel.insertedString)
      case .inputDate(let viewModel):
        let validationStatuses = validate(inputType: viewModel.inputType,
                                          insertedValue: viewModel.insertedDate ?? "")
        updateViewModel(at: IndexPath(row: $0.offset, section: 0),
                        validations: validationStatuses,
                        insertedValue: viewModel.insertedDate ?? "")
      }
    }
    
    let invalidExists = sections[safe: 0]?.rows.first {
      switch $0 {
      case .inputDate(let viewModel):
        if case .invalid = viewModel.validationStatus {
          return true
        }
        return false
      case .inputText(let viewModel):
        if case .invalid = viewModel.validationStatus {
          return true
        }
        return false
      }
    }
    return invalidExists == nil
  }
}

// MARK: - Saving

extension AddUserDataSource {
  /* func saveIfValidated() -> User? {
   // return User()
   }*/
  
  func getValidViewModel(inputType: InputType) -> String? {
    let data: [String]? = sections[safe: 0]?.rows.compactMap {
      switch $0 {
      case .inputDate(let viewModel):
        if viewModel.inputType == inputType {
          switch viewModel.validationStatus {
          case .new where viewModel.insertedDate != nil:
            return viewModel.insertedDate
          case .valid:
            return viewModel.insertedDate
          default:
            return nil
          }
        } else {
          return nil
        }
      case .inputText(let viewModel):
        if viewModel.inputType == inputType {
          switch viewModel.validationStatus {
          case .new where !viewModel.insertedString.isEmpty:
            return viewModel.insertedString
          case .valid:
            return viewModel.insertedString
          default:
            return nil
          }
        } else {
          return nil
        }
      }
    }
    
    guard let unwrappedData = data else { return nil }
    return unwrappedData.first
  }
}
