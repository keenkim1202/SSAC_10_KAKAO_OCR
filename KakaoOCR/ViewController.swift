//
//  ViewController.swift
//  KakaoOCR
//
//  Created by KEEN on 2021/11/01.
//

import UIKit
import Alamofire
import SwiftyJSON
import JGProgressHUD

class OCRViewController: UIViewController {

  // MARK: Properties
  let progress = JGProgressHUD()
  let imagePicker = UIImagePickerController()
  
  // MARK: UI
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textView: UITextView!
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setImagePicker()
  }
  
  func setImagePicker() {
    imagePicker.sourceType = .photoLibrary
    imagePicker.allowsEditing = true
    imagePicker.delegate = self
  }
  
  // MARK: Action
  
  @IBAction func onImagePick(_ sender: UIButton) {
    self.present(imagePicker, animated: true, completion: nil)
  }
  
  @IBAction func onRequest(_ sender: UIButton) {
    progress.show(in: view, animated: true)
    
    OCRAPIManager.shared.fetchOCRData(image: imageView.image!) { code, json in
      switch code {
      case 200:
        
        var words: [String]  = []
        let result = json["result"]
        
        result.forEach { r in
          let recognizedWord = r.1["recognition_words"][0].stringValue
          words.append(recognizedWord)
        }
        self.textView.text = words.joined(separator: "\n")
        self.progress.dismiss(animated: true)
        
      default:
        print("에러코드: \(code)")
        self.progress.dismiss(animated: true)
      }
    }
  }
}

// MARK: Extension -  UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension OCRViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let value = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      imageView.image = value
    }
    picker.dismiss(animated: true, completion: nil)
  }
}
