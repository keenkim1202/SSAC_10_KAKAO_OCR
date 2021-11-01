//
//  OCRAPIManager.swift
//  KakaoOCR
//
//  Created by KEEN on 2021/11/01.
//

import UIKit.UIImage
import Alamofire
import SwiftyJSON

class OCRAPIManager {
  
  static let shared = OCRAPIManager()
  typealias CompletionHandler = (Int, JSON) -> ()
  
  func fetchOCRData(image: UIImage, result: @escaping CompletionHandler) {
    
    let url = "https://dapi.kakao.com/v2/vision/text/ocr"
    let header: HTTPHeaders = [
      "Authorization": Bundle.main.apiKey,
      "Content-Type": "multipart/form-data"
    ]
    
    guard let imageData = image.pngData() else { return }
    
    AF.upload(multipartFormData: { multipartFormData in
      multipartFormData.append(imageData, withName: "image", fileName: "image")
    }, to: url, headers: header).validate(statusCode: 200...500).responseJSON { response in
      switch response.result {
      case .success(let value):
        
        let json = JSON(value)
        let code = response.response?.statusCode ?? 500
        result(code, json)
        
      case .failure(let error):
        print("ERROR: \(error)")
      }
    }
  }
}
