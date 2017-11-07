//
//  ViewController.swift
//  GitHubAPI
//
//  Created by Neto Moura on 06/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ObjectMapper

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewMain: UITableView!
    
    var ArrayRepositories = [Repositorie]()
    var cache = NSCache<AnyObject, AnyObject>()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style: .plain, target:nil, action:nil)
        
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
        
        Alamofire.request(Router.repositories(parameters: parameters))
                .responseObject { (response : DataResponse<Repositories>) in
            switch response.result {
            case .success(let data):
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
        
        cell.labelForks.text = "\(repositorie.forks_count!)"
        cell.labelForks.addImageWith(name: "icon_fork.png", behindText: false)
        
        cell.labelStars.text = "\(repositorie.stargazers_count!)"
        cell.labelStars.addImageWith(name: "icon_star.png", behindText: false)
        
        if let image = cache.object(forKey: repositorie.owner?.avatarURL as AnyObject) {
            cell.imageViewUser.maskCircle(inputImage: image as! UIImage)
        } else {
            cell.imageViewUser.image = nil
            Alamofire.request("\(repositorie.owner!.avatarURL!)").responseImage { response in
                if let image = response.result.value {
                    cell.imageViewUser.maskCircle(inputImage: image)
                    self.cache.setObject(image, forKey: repositorie.owner?.avatarURL as AnyObject)
                }
            }
        }
        cell.labelNameUser.text = repositorie.owner!.login!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repositorie = self.ArrayRepositories[indexPath.row]

        let vc = DetailTableViewController(nibName: "DetailTableViewController", bundle: nil)
        vc.repositorie = repositorie
        self.navigationController!.pushViewController(vc, animated: true)
        
    }

}
