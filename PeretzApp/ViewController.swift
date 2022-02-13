//
//  ViewController.swift
//  PeretzApp
//
//  Created by Герекмаз Газимагомедова on 12.02.2022.
//

import UIKit

class ViewController: UIViewController {

    
    let idCell = "cardCell"
    let apiUrl = "https://peretz-group.ru/api/v2/products?category=106&key=20be9031474183ea92958d5e255d888e47bdad44afd5d7b7201d0eb572be5278"
    var productsList = [Product]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        makeRequest()
        
    }

    private func makeRequest() {
        var request = URLRequest(url: URL(string: apiUrl)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            do {
                let products = try JSONDecoder().decode([Product].self, from: data!)
                self.productsList = products
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! CardTableViewCell
        let productItem = self.productsList[indexPath.row]
        cell.productName.text = productItem.name
        cell.productDesc.text = productItem.description
//        cell.productImage.image = UIImage(named: productItem.image)
        cell.productPrice.text = "\(productItem.price) ₽"
        
        return cell
    }
    
//            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//                return 100.0
//            }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.row)")
//    }
}
