//
//  UserDownloader.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

class UserDownloader {
  private let networkClient: NetworkClient
  
  init(networkClient: NetworkClient = .init()) {
    self.networkClient = networkClient
  }
}
// MARK: - Downloader implementation
extension UserDownloader {
  func loadUsersList(completion: @escaping ((Result<[User], NetworkError>) -> Void)) {
    networkClient.GET(decode: [User].self, endpoint: Endpoint.User.userList, parameters: nil, headers: nil, completion)
  }
}
