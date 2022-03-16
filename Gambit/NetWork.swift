//
//  NetWork.swift
//  Gambit
//
//  Created by Али Шамхалов on 12.03.2022.
//
import Alamofire
import Foundation
import UIKit
import SDWebImage

protocol GambitPresenterDelegate:AnyObject {
    func presentFoods(dish: [Gambit])
}
typealias PresentDelegate = GambitPresenterDelegate & UIViewController

class NetWork {
    var delegate: PresentDelegate?
    func fetchEvents(ifSuccess: @escaping ([Gambit]) -> Void, ifFailure: @escaping () -> Void) {
        AF
            .request("https://api.gambit-app.ru/category/39?page=1", method: .get)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(_):
                    if let data = try? response.result.get() {
                        let result = try! JSONDecoder().decode([Gambit].self, from: data)
                        ifSuccess(result)
                    }
                case .failure(_): ifFailure()
                }
            }
    }
    
    func viewDelegate(delegate: GambitPresenterDelegate & UITableViewController) {
        self.delegate = delegate
    }
    
    
    
}

