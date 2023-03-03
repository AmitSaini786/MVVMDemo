//
//  ProductListViewController.swift
//  MVVMPractiseDemo
//
//  Created by Amit on 18/02/23.
//

import UIKit

class ProductListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var productTableView: UITableView!
    let network = NetworkManager.sharedInstance

    // MARK: - Variables
    private var viewModel = ProductViewModel()

    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}

extension ProductListViewController {
    func configuration(){
        productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        initViewModel()
        observeEvents()
    }
    
    func initViewModel(){
        viewModel.checkInternetConnectivity { val in
            if  val {
                viewModel.fetchProducts()
                return
            }
            self.showAlert(Alert.title, message: Alert.message)
        }
        network.reachability.whenReachable = { reachability in
            if self.viewModel.products.isEmpty{
                self.viewModel.fetchProducts()
            }
        }
    }
    
    func observeEvents(){
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event{
            case .loading:
                print("Product Loading...")
                self.showIndicator()
            case .stopLoading:
                print("Stop loading...")
                self.hideIndicator()
            case .dataLoaded:
                print("Data Loaded..")
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                let _ = error?.localizedDescription
                
            }
        }
    }
}

extension ProductListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        cell.buyButton.tag = indexPath.row
        return cell
    }
    
}
