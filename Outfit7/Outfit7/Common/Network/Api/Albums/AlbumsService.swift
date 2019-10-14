//
//  AlbumsService.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

class AlbumsService {
  private let albumsDownloader: AlbumsDownloader
  
  init(albumsDownloader: AlbumsDownloader = .init()) {
    self.albumsDownloader = albumsDownloader
  }
}

// MARK: - Service implementation
extension AlbumsService {
  func getAlbumsList(completion: @escaping ((Result<[Album], NetworkError>) -> Void)) {
    // this is a great place to add localstorage/CoreData/Realm datastore implementation (inside loadUsersList of course)
    albumsDownloader.loadAlbumsList(completion: completion)
  }
}
