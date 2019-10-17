//
//  StatisticsViewController.swift
//  Outfit7
//
//  Created by Marcel Salej on 17/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol StatisticsDisplayLogic: AnyObject {
  
}

class StatisticsViewController: UIViewController {
  var interactor: StatisticsBusinessLogic?
  var router: StatisticsRoutingLogic?
  private lazy var contentView = StatisticsContentView.autolayoutView()
  
  init(delegate: StatisticsRouterDelegate?) {
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
  }
}

// MARK: - Display Logic
extension StatisticsViewController: StatisticsDisplayLogic {
  
}

// MARK: - Private Methods
private extension StatisticsViewController {
  func setupViews() {
    // setup title, background, navigation buttons, etc
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    // add constraints
  }
}
