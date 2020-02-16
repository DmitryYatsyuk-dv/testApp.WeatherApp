//
//  APIMAnager.swift
//  WeatherApp
//
//  Created by Lucky on 16/02/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import Foundation


typealias JSONTask = URLSessionDataTask
typealias JSONComplitionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

enum APIResult<T> {
    case Success(T)
    case Failure(Error)
    
}

protocol APIManager {
    
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith(request: URLRequest, completionHandler: JSONComplitionHandler) -> JSONTask
    
    func fetch<T>(request: URLRequest,
                  parse: ([String: AnyObject]?) -> T?,
                  completionHandler: (APIResult<T>) -> Void)
    
    init(sessionConfiguration: URLSessionConfiguration)
    
}

