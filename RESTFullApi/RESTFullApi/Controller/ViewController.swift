//
//  ViewController.swift
//  RESTFullApi
//
//  Created by Md Hosne Mobarok on 30/3/22.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var rest = RestManager()
    var apiData: [Datum]?
    
    var user : User?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDate()
        
        tableView.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
    }
    
    private func loadDate() {
        guard let url = URL(string: "https://reqres.in/api/users") else { return }
        rest.makeRequest(toURL: url, withHttpMethod: .get) { [self] result in
            
            if result.error != nil {
                print("Got error with \(String(describing: result.error))")
                return
            }
            
            if let data = result.data {
                print("successful")
                print(data)
                
                let decoder = JSONDecoder()
                guard let userData = try? decoder.decode(User.self, from: data) else { return }
                
//                print(userData.page)
//                print(userData.data[0].email)
                
                apiData = userData.data
                user = userData
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

}

// MARK: - TableView Datasource Method.
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let apiData = apiData {
            return apiData.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if let userList = self.user?.data {
            cell.setup(data: userList[indexPath.row])
        }
        
        return cell
    }
    
}
