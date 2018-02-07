//
//  DetailViewController.swift
//  JSONPlusImage
//
//  Created by Zaur Giyasov on 07/02/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    var country: JSONData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstLabel.text = "Country: " + (country?.name)!
        secondLabel.text = "Native name: " + (country?.nativeName)!
        thirdLabel.text = "Capital: " + (country?.capital)!
        
        if let population = country?.population {
            lastLabel.text = "Population: \(String(describing: population))"
        } else {
             lastLabel.text = "Population: ??? (is optional value!)"
        }

        let emojiImage = "🏁".emojiToImage()
        flagImage.image = emojiImage
        
//        if let urlString = country?.flag {
//            let url = URL(string: urlString)
//            print(url?.absoluteString ?? "string from url error!")
//            let data = try? Data(contentsOf: url!)
//            flagImage.image = UIImage(data: data!)
//        }
        
    }
}
