//
//  Bundle++Extension.swift
//  KakaoOCR
//
//  Created by KEEN on 2021/11/01.
//

import Foundation

extension Bundle {
  var apiKey: String {
    guard let file = self.path(forResource: "APIKEY", ofType: "plist") else { return "" }
    
    guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
    guard let key = resource["API_KEY"] as? String else { fatalError("APIKEY.plist에 API_KEY설정을 해주세요.")}
    return key
  }
}
