//
//  ViewController.swift
//  CatGenerator
//
//  Created by Lilia Chechina on 24.12.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catimageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func didTapCatGnerateButton(_ sender: Any) {
//        textLabel.text = "Hello, world!"
        dowloadCat()
        
    }
    private func dowloadCat(){
        guard let url = URL(string: "https://cataas.com/cat") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self]
            data, response, error in guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                [weak self] in self?.catimageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}

