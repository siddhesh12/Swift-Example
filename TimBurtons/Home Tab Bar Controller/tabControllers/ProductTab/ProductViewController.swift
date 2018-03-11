//
//  HomeViewController.swift
//  TimBurtons
//
//  Created by Siddhesh Mahadeshwar on 09/03/18.
//  Copyright © 2018 net.siddhesh. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var productTableView: UITableView!
    var arrayProducts:[Product]?

    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.delegate = self
        productTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupPage()
    }
    
    func setupPage()
    {
        APIManager.shared.getProducts { (products, error) in
            if let products = products
            {
                self.arrayProducts = products
                self.productTableView.reloadData()
            }
            else
            {
                print(error!.localizedDescription)
            }
        }
    }
    // MARK: - Tableview delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrayProducts?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        guard let product = arrayProducts?[indexPath.row] else {return cell}
        cell.titleLabel.text = product.name
        cell.priceLabel.text = "$ \(product.cost ?? 0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
