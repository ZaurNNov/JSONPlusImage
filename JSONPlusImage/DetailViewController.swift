//
//  DetailViewController.swift
//  JSONPlusImage
//
//  Created by Zaur Giyasov on 07/02/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, UIWebViewDelegate {

    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
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
        
        if let urlString = country?.flag {
            let fileURL:URL = URL(string: urlString)!
            print(fileURL.absoluteString)
            let req = URLRequest(url: fileURL)
            webView.uiDelegate = self
            webView.load(req)
            webView.layoutMarginsDidChange()
        }
        else {
            //handle here if path not found
            print(country?.flag ?? "string from url error!")
        }
        
//        let path = Bundle.main.path(forResource: "svgNameFileHere", ofType: "svg")!
//        if path != "" {
//            let fileURL:URL = URL(fileURLWithPath: path)
//            let req = URLRequest(url: fileURL)
//            self.webView.scalesPageToFit = false
//            self.webView.loadRequest(req)
//        }
//        else {
//            //handle here if path not found
//        }
        
//        if let urlString = country?.flag {
//            let url = URL(string: urlString)
//            print(url?.absoluteString ?? "string from url error!")
//            let data = try? Data(contentsOf: url!)
//            flagImage.image = UIImage(data: data!)
//        }
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        spinner.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinner.stopAnimating()
        webView.stopLoading()
    }
    
}
