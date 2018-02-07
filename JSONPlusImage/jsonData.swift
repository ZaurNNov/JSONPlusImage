//
//  jsonData.swift
//  JSONPlusImage
//
//  Created by Zaur Giyasov on 07/02/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

import Foundation
import UIKit

struct JSONData: Decodable {
    let name : String
    let nativeName: String
    let capital: String
    let population: Int?
    let flag: String
    
    

}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    print("*** Image not found from url!")
                    return
                }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}



extension String {
    
    func emojiToImage() -> UIImage? {
        let size = CGSize(width: 30, height: 35)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: CGPoint(), size: size)
        UIRectFill(CGRect(origin: CGPoint(), size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 30)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}



/**
///JSON struct from web
https://restcountries.eu/#rest-countries
https://restcountries.eu/rest/v2/all

 /*
 {
 name: "Afghanistan",
 topLevelDomain: [
 ".af"
 ],
 alpha2Code: "AF",
 alpha3Code: "AFG",
 callingCodes: [
 "93"
 ],
 capital: "Kabul",
 altSpellings: [
 "AF",
 "Afġānistān"
 ],
 region: "Asia",
 subregion: "Southern Asia",
 population: 27657145,
 latlng: [
 33,
 65
 ],
 demonym: "Afghan",
 area: 652230,
 gini: 27.8,
 timezones: [
 "UTC+04:30"
 ],
 borders: [
 "IRN",
 "PAK",
 "TKM",
 "UZB",
 "TJK",
 "CHN"
 ],
 nativeName: "افغانستان",
 numericCode: "004",
 currencies: [
 {
 code: "AFN",
 name: "Afghan afghani",
 symbol: "؋"
 }
 ],
 languages: [
 {
 iso639_1: "ps",
 iso639_2: "pus",
 name: "Pashto",
 nativeName: "پښتو"
 },
 {
 iso639_1: "uz",
 iso639_2: "uzb",
 name: "Uzbek",
 nativeName: "Oʻzbek"
 },
 {
 iso639_1: "tk",
 iso639_2: "tuk",
 name: "Turkmen",
 nativeName: "Türkmen"
 }
 ],
 translations: {
 de: "Afghanistan",
 es: "Afganistán",
 fr: "Afghanistan",
 ja: "アフガニスタン",
 it: "Afghanistan",
 br: "Afeganistão",
 pt: "Afeganistão",
 nl: "Afghanistan",
 hr: "Afganistan",
 fa: "افغانستان"
 },
 flag: "https://restcountries.eu/data/afg.svg",
 regionalBlocs: [
 {
 acronym: "SAARC",
 name: "South Asian Association for Regional Cooperation",
 otherAcronyms: [ ],
 otherNames: [ ]
 }
 ],
 cioc: "AFG"
 },
 
 */
 */
