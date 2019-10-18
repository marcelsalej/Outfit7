//
//  StatisticsContentView.swift
//  Outfit7
//
//  Created by Marcel Salej on 17/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class StatisticsContentView: UIView {
  private let statisticsTitleLabel = UILabel.setupAutoLayout()
  private let avgSalaryLabel = UILabel.setupAutoLayout()
  private let avgAgeLabel = UILabel.setupAutoLayout()
  private let maxRatingLabel = UILabel.setupAutoLayout()
  let avgSalaryValueLabel = UILabel.setupAutoLayout()
  let avgAgeValueLabel = UILabel.setupAutoLayout()
  let maxRatingValueLabel = UILabel.setupAutoLayout()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension StatisticsContentView {
  func setupViews() {
    setupStatisticsTitleLabel()
    setupAvgSalaryLabel()
    setupAvgSalaryValueLabel()
    setupAvgAgeLabel()
    setupAvgAgeValueLabel()
    setupMaxRatingLabel()
    setupMaxRatingValueLabel()
  }
  
  func setupStatisticsTitleLabel() {
    addSubview(statisticsTitleLabel)
    statisticsTitleLabel.text = "Statistics".uppercased()
    statisticsTitleLabel.textColor = .black
    statisticsTitleLabel.font = .boldSystemFont(ofSize: 18)
    statisticsTitleLabel.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
      $0.centerX.equalToSuperview()
    }
  }
  
  func setupAvgSalaryLabel() {
    addSubview(avgSalaryLabel)
    avgSalaryLabel.text = "Avg. salary: "
    avgSalaryLabel.textColor = .black
    avgSalaryLabel.lineBreakMode = .byClipping
    avgSalaryLabel.font = .boldSystemFont(ofSize: 12)
    avgSalaryLabel.snp.makeConstraints {
      $0.top.equalTo(statisticsTitleLabel.snp.bottom).offset(20)
      $0.leading.equalToSuperview().inset(15)
    }
  }
  
  func setupAvgSalaryValueLabel() {
    addSubview(avgSalaryValueLabel)
    avgSalaryValueLabel.textColor = .black
    avgSalaryValueLabel.textAlignment = .left
    avgSalaryValueLabel.font = .boldSystemFont(ofSize: 14)
    avgSalaryValueLabel.snp.makeConstraints {
      $0.top.equalTo(statisticsTitleLabel.snp.bottom).offset(20)
      $0.leading.equalTo(avgSalaryLabel.snp.trailing).offset(5)
      $0.trailing.equalToSuperview().inset(15)
      $0.width.equalTo(avgSalaryLabel).multipliedBy(3.5)
    }
  }
  
  func setupAvgAgeLabel() {
    addSubview(avgAgeLabel)
    avgAgeLabel.text = "Avg. age: "
    avgAgeLabel.textColor = .black
    avgAgeLabel.lineBreakMode = .byClipping
    avgAgeLabel.font = .boldSystemFont(ofSize: 12)
    avgAgeLabel.snp.makeConstraints {
      $0.top.equalTo(avgSalaryLabel.snp.bottom).offset(20)
      $0.leading.equalToSuperview().inset(15)
    }
  }
  
  func setupAvgAgeValueLabel() {
    addSubview(avgAgeValueLabel)
    avgAgeValueLabel.textColor = .black
    avgAgeValueLabel.font = .boldSystemFont(ofSize: 14)
    avgAgeValueLabel.textAlignment = .left
    avgAgeValueLabel.snp.makeConstraints {
      $0.top.equalTo(avgSalaryLabel.snp.bottom).offset(20)
      $0.leading.equalTo(avgAgeLabel.snp.trailing).offset(5)
      $0.trailing.equalToSuperview().inset(15)
    }
  }
  
  func setupMaxRatingLabel() {
    addSubview(maxRatingLabel)
    maxRatingLabel.text = "Max rating: "
    maxRatingLabel.textColor = .black
    maxRatingLabel.lineBreakMode = .byClipping
    maxRatingLabel.font = .boldSystemFont(ofSize: 12)
    maxRatingLabel.snp.makeConstraints {
      $0.top.equalTo(avgAgeLabel.snp.bottom).offset(20)
      $0.leading.equalToSuperview().inset(15)
    }
  }
  
  func setupMaxRatingValueLabel() {
    addSubview(maxRatingValueLabel)
    maxRatingValueLabel.textColor = .black
    maxRatingValueLabel.textAlignment = .left
    maxRatingValueLabel.font = .boldSystemFont(ofSize: 14)
    maxRatingValueLabel.snp.makeConstraints {
      $0.top.equalTo(avgAgeValueLabel.snp.bottom).offset(15)
      $0.leading.equalTo(maxRatingLabel.snp.trailing).offset(5)
      $0.trailing.equalToSuperview().inset(15)
    }
  }
}
