//
//  ViewController.swift
//  JSONPlusImage
//
//  Created by Zaur Giyasov on 07/02/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mainTableView: UITableView!
    var countries = [JSONData]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        downloadJSON {
            print("*** Succes!")
            self.mainTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = countries[indexPath.row].name.localizedCapitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "shoeDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.country = countries[(mainTableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func downloadJSON(complited: @escaping () -> ())
    {
        let urlString = "https://restcountries.eu/rest/v2/all"
        guard let url = URL(string: urlString) else {
            print("*** Can't create URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data else {
                print("*** Can't create URL!")
                return
            }
            
            do {
                self.countries = try JSONDecoder().decode([JSONData].self, from: data)
                
                DispatchQueue.main.async {
                    complited()
                }
                
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }



}

