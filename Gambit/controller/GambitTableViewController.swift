//
//  GambitTableViewController.swift
//  Gambit
//
//  Created by Али Шамхалов on 12.03.2022.
//
import SwiftUI
import UIKit

class GambitTableViewController: UITableViewController, GambitPresenterDelegate {
    func presentFoods(dish: [Gambit]) {
        self.dish = dish
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    

    var network = NetWork ()
    var objects: [Gambit] = []
    var dish = [Gambit] ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        network.viewDelegate(delegate: self)
        network.fetchEvents { products in
            self.objects = products
            self.tableView.reloadData()
        } ifFailure: {
        print("ошибка")
    }
}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return objects.count
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favourite = favouriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [favourite])
    }

    func favouriteAction(at indexPath: IndexPath) -> UIContextualAction {
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
        object.isFavourite = !(object.isFavourite ?? true)
        self.objects[indexPath.row] = object
        completion(true)
        }
        action.backgroundColor = object.isFavourite ?? true ? .systemGray: .systemPink
        action.image = UIImage(systemName:  "heart")
        return action
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "gambitCell", for: indexPath) as? GambitTableViewCell else { return UITableViewCell()
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GambitTableViewCell.identifier) as! GambitTableViewCell
        }
        cell.set(with: objects[indexPath.row])

        
        return cell
    
}

//    extension GambitTableViewController: UITableViewDataSource, UITableViewDelegate {
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return dish.enumerated()
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: GambitTableViewCell.identifier) as! FoodTableViewCell
//            let dish = dish[indexPath.row]
//            cell.set(objects: Gambit)
//            return cell
//        }
//    }
}
