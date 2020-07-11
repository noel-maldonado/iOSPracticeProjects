//
//  ViewController.swift
//  ImageRequest
//
//  Created by Noel Maldonado on 7/10/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import UIKit

import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    let imageLocation = KittenImageLocation.http.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func handleLoadImageButton(_ sender: UIButton) {
        guard let imageURL = URL(string: imageLocation) else {
            print("Cannot create URL")
            return
        }
        let task = URLSession.shared.dataTask(with: imageURL) {
         (data, respone, error) in
            guard let data = data else {
                print("no data, or there was an error")
                return
            }
            let downloadedImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.image.image = downloadedImage
            }
            
        }
        task.resume()
        
    }
    
    enum KittenImageLocation: String {
        case http = "http://www.kittenswhiskers.com/wp-content/uploads/sites/23/2014/02/Kitten-playing-with-yarn.jpg"
        case https = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Kitten_in_Rizal_Park%2C_Manila.jpg/460px-Kitten_in_Rizal_Park%2C_Manila.jpg"
        case error = "not a url"
    }
    
    
}

