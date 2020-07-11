//
//  ViewController.swift
//  Randog
//
//  Created by Noel Maldonado on 7/10/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let randomImageEndpoint = DogAPI.Endpoint.randomImageFromAllDogsCollection.url
        let task = URLSession.shared.dataTask(with: randomImageEndpoint) { (data, response, error) in
            guard let data = data else { return }
            print(data)
            
            let decoder = JSONDecoder()
            
            let imageData = try! decoder.decode(DogImage.self, from: data)
            
            guard let imageURL = URL(string: imageData.message) else { return }
            
            let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                guard let data = data else { return }
                
                let downloadedImage = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self.imageView.image = downloadedImage
                }
            }
            task.resume()
            
        }
        
        task.resume()
    }

    

}

