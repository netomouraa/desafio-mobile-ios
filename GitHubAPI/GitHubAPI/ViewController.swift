//
//  ViewController.swift
//  GitHubAPI
//
//  Created by Neto Moura on 06/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewMain: UITableView!
    
    var ArrayRepositories = [Repositorie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        request()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func request(){
        
        let parameters: [String: Any] = [
            "q": "language:Java",
            "sort": "stars",
            "page": "\(1)",
            ]
        
            Alamofire.request(Router.search(parameters))
                .responseObject { (response : DataResponse<Repositories>) in
            
            switch response.result {
            case .success(let data):
                print(data)
                
                if(response.response?.statusCode == 200){
                    self.ArrayRepositories = data.items!
                    self.tableViewMain.reloadData()
                }
              
            case .failure(let error):
                
                print("ERRO! \(error)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ArrayRepositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell

        let repositorie = self.ArrayRepositories[indexPath.row]
        
        cell.labelName.text = repositorie.name
        cell.labelDescription.text = repositorie.description
        
        
        
        return cell
    }

}
