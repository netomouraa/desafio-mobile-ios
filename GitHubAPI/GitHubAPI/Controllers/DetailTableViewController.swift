//
//  DetailTableViewController.swift
//  GitHubAPI
//
//  Created by Neto Moura on 06/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import SafariServices

class DetailTableViewController: UITableViewController {
    
    var repositorie: Repositorie?
    var arrayPulls = [PullRequests]()
    var cache = NSCache<AnyObject, AnyObject>()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = repositorie?.name
        
        let nibNameCell = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register(nibNameCell, forCellReuseIdentifier: "detailCell")
        
        tableView.estimatedRowHeight = 25
        tableView.rowHeight = UITableViewAutomaticDimension
    
        request()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func request(){
        let parameters: [String: Any] = [
            "page": "\(1)"
        ]
        Alamofire.request(Router.pulls(repo: repositorie!.full_name!, parameters: parameters))
            .responseArray { (response : DataResponse<[PullRequests]>) in
                switch response.result {
                case .success(let data):
                    if(response.response?.statusCode == 200){
                        self.arrayPulls = data
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print("ERRO! \(error)")
                }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPulls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell

        let repo = self.arrayPulls[indexPath.row]
        
        cell.labelTitle.text = repo.title
        cell.labelDescription.text = repo.body
        
        if let image = cache.object(forKey: repo.user!.id as AnyObject) {
            cell.imageViewUser.maskCircle(inputImage: image as! UIImage)
        }else {
            cell.imageViewUser.image = nil
            Alamofire.request("\(repo.user!.avatarURL!)").responseImage { response in
                if let image = response.result.value {
                    cell.imageViewUser.maskCircle(inputImage: image)
                    self.cache.setObject(image, forKey: repo.user!.id as AnyObject)
                }
            }
        }
        
        cell.labelNameUser.text = repo.user!.login
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone.current
        let date = dateFormatter.date(from: (repo.updated_at)!)!
        
        let calendar = NSCalendar.current
        let date1 = calendar.startOfDay(for: date)
        let date2 = calendar.startOfDay(for: Date())
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        cell.labelDate.text = "about \(components.day!) day(s) ago"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let repo = self.arrayPulls[indexPath.row]

        if #available(iOS 9.0, *) {
            let SafariVC = SFSafariViewController(url: URL(string: repo.url!)!)
            self.present(SafariVC, animated: true, completion: nil)
        } else {
            let mywebViewController = UIViewController()
            let webView: UIWebView = UIWebView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            let url = URL(string: repo.url!)
            let request = URLRequest(url: url!)
            webView.loadRequest(request)
            mywebViewController.view = webView

            let navController = UINavigationController(rootViewController: mywebViewController)
            mywebViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissWebView))
            self.navigationController!.present(navController, animated: true, completion: nil)
        }
    }
    
    @objc func dismissWebView(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

}
