//
//  AlbumsDownloader.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

class AlbumsDownloader {
  private let networkClient: NetworkClient
  
  init(networkClient: NetworkClient = .init()) {
    self.networkClient = networkClient
  }
}

extension AlbumsDownloader {
  func loadAlbumsList(completion: @escaping((Result<[Album], NetworkError>) -> Void)) {
    networkClient.GET(decode: [Album].self, endpoint: Endpoint.Albums.albumsList, completion)
  }
}
