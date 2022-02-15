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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
        makeRequest()
    }

    private func makeRequest() {
        spinner.startAnimating()

        var request = URLRequest(url: URL(string: apiUrl)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            do {
                let products = try JSONDecoder().decode([Product].self, from: data!)
                self.productsList = products
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    spinner.stopAnimating()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? CardTableViewCell else { return UITableViewCell() }
        let productItem = productsList[indexPath.row]
        
        cell.configure(product: productItem)
        
        return cell
    }
}
