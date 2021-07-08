//
//  ViewController.swift
//  PaddleOCRDemo
//
//  Created by Leonard on 2021/5/13.
//

import UIKit
import PaddleOCR

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "sometext")
    }

    @IBAction func start(_ sender: UIButton) {
        guard let recognitionImage = imageView.image else { return }
        MLPaddleOCR().scanText(from: recognitionImage, complete: { (result) in
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
    
    @IBAction func selectPhoto(_ sender: UIButton) {
        let alertController = UIAlertController(title:nil,
                                                message: nil,
                                                preferredStyle:.actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        let takingPicturesAction = UIAlertAction(title: "拍照", style: .default) { action in
            self.selectPhotoFromAlbum(takingPictures: true)
        }
        let albumAction = UIAlertAction(title: "相册", style: .default) { action in
            self.selectPhotoFromAlbum(takingPictures: false)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(takingPicturesAction)
        alertController.addAction(albumAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func selectPhotoFromAlbum(takingPictures: Bool) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = takingPictures ? .camera : .photoLibrary
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image:UIImage!
        if let eidtImage = info[.editedImage] as? UIImage {
            image = eidtImage
        }else{
            image = info[.originalImage] as? UIImage
        }
        imageView.image = image
        picker.dismiss(animated: true, completion:nil)
    }
    
    private func showAlertString(_ content: String) {
        let alertController = UIAlertController(title: "识别结果", message: content.isEmpty ? "没有识别到有效的信息" : content, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "我知道了", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

}

