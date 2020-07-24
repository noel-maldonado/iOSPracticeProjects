//
//  ViewController.swift
//  Randog
//
//  Created by Noel Maldonado on 7/10/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    let breeds: [String] = ["Breed One", "Breed Two"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.dataSource = self
        pickerView.delegate = self
        
        DogAPI.requestRandomImage(completionHandler: handleRanomImageResponse(imageData:error:))

        }
        
    func handleRanomImageResponse(imageData: DogImage?, error: Error?) {
        guard let imageURL = URL(string: imageData?.message ?? "") else { return }
        
        DogAPI.requestImageFile(url: imageURL, completionHandler: self.handleImageFileResponse(image:error:))
    }
    
    
    func handleImageFileResponse(image: UIImage?, error: Error?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breeds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breeds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DogAPI.requestRandomImage(completionHandler: handleRanomImageResponse(imageData:error:))
    }
    
}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
}
