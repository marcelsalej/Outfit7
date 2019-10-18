//
//  StatisticsViewController.swift
//  Outfit7
//
//  Created by Marcel Salej on 17/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol StatisticsDisplayLogic: AnyObject {
  func displayStatisticsView(viewModel: StatisticsViewController.ViewModel)
}

class StatisticsViewController: UIViewController {
  var interactor: StatisticsBusinessLogic?
  var router: StatisticsRoutingLogic?
  private lazy var contentView = StatisticsContentView.setupAutoLayout()
  private let userList: [User]
  
  init(delegate: StatisticsRouterDelegate?, userList: [User]) {
    self.userList = userList
    super.init(nibName: nil, bundle: nil)
    let interactor = StatisticsInteractor()
    let presenter = StatisticsPresenter()
    let router = StatisticsRouter()
    interactor.presenter = presenter
    presenter.viewController = self
    router.viewController = self
    router.delegate = delegate
    self.interactor = interactor
    self.router = router
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    interactor?.calculateStatistics(for: userList)
  }
}

// MARK: - Display Logic
extension StatisticsViewController: StatisticsDisplayLogic {
  func displayStatisticsView(viewModel: StatisticsViewController.ViewModel) {
    contentView.avgSalaryValueLabel.text = String(format: "%.2f", viewModel.avgSalary)
    let dateComponentsFormatter = DateComponentsFormatter()
    dateComponentsFormatter.allowedUnits = [.year, .day]
    dateComponentsFormatter.unitsStyle = .full
    contentView.avgAgeValueLabel.text = dateComponentsFormatter.string(from: abs(viewModel.avgAge))
    contentView.maxRatingValueLabel.text = String(format: "%.2f", viewModel.maxRating)
  }
}

// MARK: - Private Methods
private extension StatisticsViewController {
  func setupViews() {
    setupContentView()
    setupNavigation()
  }
  
  func setupNavigation() {
    navigationItem.title = "Statistics".uppercased()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.backgroundColor = .white
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}

extension StatisticsViewController {
  struct ViewModel {
    let avgSalary: Double
    let avgAge: Double
    let maxRating: Double
  }
}
