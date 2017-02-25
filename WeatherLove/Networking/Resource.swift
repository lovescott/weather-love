//
//  Resource.swift
//  WeatherLove
//
//  Created by Scott Love on 2/25/17.
//  Copyright © 2017 Scott Love. All rights reserved.
//

import Foundation
typealias JSONDictionary = [String: AnyObject]

//This Resource is simple but could be extended easily with
//
//enum RequestType {
//    case get
//    case post
//}
// Then add RequestType to init with a requestType property

struct Resource<A> {
    public var url: URL
    public var parse: (Data) -> A?
    
    public init(url: URL, parse: @escaping (Data) -> A?) {
        self.url = url
        self.parse = parse
    }
}

extension Resource {
   
    public init(url: URL, parseJSON: @escaping (Any) -> A?) {
        self.url = url
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
            return json.flatMap(parseJSON)
        }
    }
}
