//
//  NetworkClient.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Alamofire

protocol NetworkClientProtocol {
  typealias Headers = HTTPHeaders
  typealias Params = [String: Any]
  typealias DataResult = ((Result<Data, NetworkError>) -> Void)?
  typealias DecoderConfigurator = ((JSONDecoder) -> Void)?
  typealias EncoderConfigurator = ((JSONEncoder) -> Void)?
  
  func GET(endpoint: EndpointProtocol,
           parameters: Params?,
           headers: Headers?,
           _ result: DataResult)
  
  func GET<T: Decodable>(decode: T.Type,
                         decoderConfigurator: DecoderConfigurator,
                         endpoint: EndpointProtocol,
                         parameters: Params?,
                         headers: Headers?,
                         _ result: ((Result<T, NetworkError>) -> Void)?)
}
