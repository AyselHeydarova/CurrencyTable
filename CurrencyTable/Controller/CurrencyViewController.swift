//
//  ViewController.swift
//  CurrencyTable
//
//  Created by Aysel Heydarova on 10/20/20.
//


import UIKit

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var swipeLineContainer: UIView!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let currenciesVM = CurrenciesVM()
    var swipeInteractionController: SwipeInteractionController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        line.layer.cornerRadius = 2
        swipeInteractionController = SwipeInteractionController(viewController: self)
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "CurrencyCell", bundle: nil), forCellReuseIdentifier: "CurrencyCell")
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        tableView.layer.cornerRadius = 10
        tableView.reloadData()
    }
}


extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currenciesVM.currencies.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            return headerCell
            
        } else {
            
            let  cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
            cell.setUpCell(currency: currenciesVM.currencies[indexPath.row - 1])
            return cell
        }
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 110
        } else {
            return (tableView.frame.height - 150) / CGFloat(currenciesVM.currencies.count)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currenciesVM.selectCurrency(index: indexPath.row - 1)
        tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
}

