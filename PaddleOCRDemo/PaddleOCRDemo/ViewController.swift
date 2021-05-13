//
//  ViewController.swift
//  PaddleOCRDemo
//
//  Created by Leonard on 2021/5/13.
//

import UIKit
import PaddleOCR

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "sometext")
    }

    @IBAction func start(_ sender: UIButton) {
        guard let recognitionImage = imageView.image else { return }
        RYPaddleOCR().scanText(from: recognitionImage, complete: { (result) in
            guard let ocrResultList = result else { return }
            var resultString = ""
            for ocrData in ocrResultList {
                if !ocrData.label.isEmpty {
                    resultString = resultString + ocrData.label + "\n"
                }
            }
            DispatchQueue.main.async {
                self.showAlertString(resultString)
            }
        })
    }
    
    private func showAlertString(_ content: String) {
        let alertController = UIAlertController(title: "识别结果", message: content.isEmpty ? "没有识别到有效的信息" : content, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "我知道了", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

}

