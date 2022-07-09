//
//  SpyMarvelURLProtocol.swift
//  MarvelpopUnitTests
//
//  Created by Adrià Ros on 6/7/22.
//

import Foundation
import XCTest

final class SpyMarvelURLProtocol: URLProtocol {
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let url = request.url else {
            assertionFailure("SpyMarvelURLProtocol - Received unexpected request")
            return
        }
        
        guard let urlStr = request.url?.absoluteString else {
            assertionFailure("SpyMarvelURLProtocol - Received unexpected URL")
            return
        }
        
        XCTAssertTrue(urlStr.contains("https://gateway.marvel.com"))
        XCTAssertTrue(urlStr.contains("ts=1"))
        XCTAssertTrue(urlStr.contains("apikey=3f97481a2c63a608a96d49b2579c5ccd"))
        XCTAssertTrue(urlStr.contains("hash=154d2a478296ac78de818ce0b684cfde"))
        
        client?.urlProtocol(self, didReceive: HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: Data())
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}
