//
//  ViewController.swift
//  CodingChallange
//
//  Created by Munyee on 07/06/2018.
//  Copyright © 2018 Chan Mun Yee. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var autoSuggestTableView: UITableView = UITableView()
    var searchedKey = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchImage(searchKey: String) {
        let urlString = "https://pixabay.com/api/?key=8784025-cf52019efab6bf1a33f346a67&q=\(searchKey)&image_type=photo"
        let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
           print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
        }
        
        task.resume()
    }
    
    // MARK: - Tableview delegate and datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedKey.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchBarTableViewCell;
        cell.suggestLabel.text = searchedKey[indexPath.row];
        return cell;
    }
    
    // MARK: - Searchbar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text == "") {
            searchedKey.append(searchBar.text!);
            self.searchImage(searchKey: searchBar.text!);
        }
    }
    


}

