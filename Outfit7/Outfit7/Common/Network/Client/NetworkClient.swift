//
//  NetworkClient.swift
//  Outfit7
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Alamofire

class NetworkClient {
  private let manager: Alamofire.Session
  
  init() {
    manager = Alamofire.Session(configuration: URLSessionConfiguration.default)
  }
}

// MARK: - Public methods
extension NetworkClient: NetworkClientProtocol {
  /// GET rest api request
  func GET(endpoint: EndpointProtocol,
           parameters: NetworkClientProtocol.Params? = nil,
           headers: NetworkClientProtocol.Headers? = nil,
           _ result: DataResult) {
    request(endpoint: endpoint,
            method: .get,
            parameters: parameters,
            headers: headers,
            result
    )
  }
  
  func GET<T: Decodable>(decode: T.Type,
                         decoderConfigurator: NetworkClientProtocol.DecoderConfigurator = nil,
                         endpoint: EndpointProtocol,
                         parameters: NetworkClientProtocol.Params? = nil,
                         headers: NetworkClientProtocol.Headers? = nil,
                         _ result: ((Result<T, NetworkError>) -> Void)?) {
    let decoder = JSONDecoder.default
    decoderConfigurator?(decoder)
    request(endpoint: endpoint,
            method: .get,
            parameters: parameters,
            headers: headers) {
              switch $0 {
              case .success(let response):
                DispatchQueue.global(qos: .background).async {
                  do {
                    let decodedObject = try JSONDecoder.default.decode(T.self, from: response)
                    DispatchQueue.main.async { result?(.success(decodedObject)) }
                  } catch {
                    DispatchQueue.main.async { result?(.failure(.jsonDecode(error)))}
                  }
                }
              case .failure(let error):
                DispatchQueue.main.async { result?(.failure(error)) }
              }
    }
  }
}

// MARK: - Private Methods
private extension NetworkClient {
  func request(endpoint: EndpointProtocol,
               method: HTTPMethod,
               parameters: NetworkClientProtocol.Params? = nil,
               headers: Headers? = nil,
               _ result: NetworkClientProtocol.DataResult) {
    Logger.debug("\(method.rawValue) (started): " + endpoint.path, params: ["url": endpoint.url])
    let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.default
    manager
      .request(endpoint.url, method: method, parameters: parameters, encoding: encoding, headers: headers)
      .validate(statusCode: 200..<300)
      .responseData { response in
        let statusCode = response.response?.statusCode ?? 0
        switch response.result {
        case .success(let data):
          Logger.debug("\(method.rawValue) (success): " + endpoint.path, params: ["status": statusCode, "url": endpoint.url])
          result?(.success(data))
        case .failure:
          Logger.debug("\(method.rawValue) (failure): " + endpoint.path, params: ["status": statusCode, "url": endpoint.url])
          response.data.map { String(data: $0, encoding: .utf8) }?.map { Logger.error($0) }
        }
    }
  }
}
