//
//  GambitTableViewCell.swift
//  Gambit
//
//  Created by Али Шамхалов on 12.03.2022.
//

import UIKit

class GambitTableViewCell: UITableViewCell {
    
    static let identifier = "gambitCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var variationsLabel: UILabel!
    @IBOutlet weak var imageViewDish: UIImageView!
    @IBOutlet weak var minButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var basketButton: UIButton!
    
    
    
    let defaults = UserDefaults.standard
    var variations = 0
    var id = 0
    
    
    func hideBasket(_ action: Bool){
        basketButton.isHidden = action
        
    }
    func saveVariations(_ varfood: Int) {
        variationsLabel.text = String(varfood)
        defaults.set(varfood , forKey: String(id))
    }
    
    
    
    func setFood (with gambit : Gambit) {
        
        self.nameLabel.text = gambit.name
        self.priceLabel.text = "\(gambit.price) ₽"
        self.id = gambit.id
        self.imageViewDish.downloaded(from: gambit.image)
        
            if defaults.integer(forKey: String(id)) > 0 {
                self.variationsLabel.text = String(defaults.integer(forKey: String(id)))
                variations = defaults.integer(forKey: String(id))
                hideBasket(true)
        }
    }
    func calculation(_ calculation: Bool) {
        if calculation {
            variations += 1
        } else {
            variations -= 1
        }
    }
    
    @IBAction func pressButtonMin(_ sender: UIButton) {
        calculation(false)
        saveVariations(variations)
        if variations == 0 {
            hideBasket(false)
        }
    }
    
    
    @IBAction func korzina(_ sender: UIButton) {
        calculation(true)
        saveVariations(variations)
        hideBasket(true)
    }
    //
    @IBAction func pressButtonPlus(_ sender: UIButton) {
        calculation(true)
        saveVariations(variations)
    }
}
//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//            else { return }
//            DispatchQueue.main.async() { [weak self] in
//                self?.image = image
//            }
//        }.resume()
//    }
//    
//    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//    
//    
//}



