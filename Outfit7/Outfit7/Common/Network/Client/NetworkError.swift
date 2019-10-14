//
//  NetworkError.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum NetworkError: Error {
  case noData
  case notAuthorized
  case serverError
  case keyMissingFromResponse
  case serverFailedResponse
  case notSignedIn
  case jsonDecode(Error)
  case generic(Error)
  case message(String?)
}
