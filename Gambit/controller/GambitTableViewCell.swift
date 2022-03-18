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
    var product: Gambit?
    func hideBasket(_ action: Bool){
        basketButton.isHidden = action
        
    }
    func saveVariations(_ varfood: Int) {
        variationsLabel.text = String(varfood)
        defaults.set(varfood, forKey: String(product?.id ?? 0))
    }

    
    
    func set (with gambit : Gambit) {
        
        self.nameLabel.text = gambit.name
        self.priceLabel.text = String(gambit.price) + "₽"
        self.imageViewDish.downloaded(from: gambit.image)
        
        //imageViewDish.image = UIImage(named: object.image)
//
        if defaults.integer(forKey: String(product?.id ?? 0))  > 0 {
            self.variationsLabel.text = String(defaults.integer(forKey: String(product?.id ?? 0)))
            variations = defaults.integer(forKey: String(product?.id ?? 0))
            hideBasket(true)
        }
 }
    func calculation(_ calculation: Bool) {
        if (calculation) {
            variations = variations + 1
        } else {
            variations = variations - 1
        }
        
    }
    @IBAction func pressButtonMin(_ sender: UIButton) {
        calculation(true)
        saveVariations(variations)
        hideBasket(true)
    }
//        guard variations > 0 else { return }
//        if variations == 1 {
//            hideMinus(true)
//        }
//        calculation(false)
//        saveVariations(variations)
//        if variations > 0 {
//            hideMinus(false)
//        }
//
//
   
    @IBAction func korzina(_ sender: UIButton) {
        calculation(true)
        saveVariations(variations)
    }
//
    @IBAction func pressButtonPlus(_ sender: UIButton) {
        calculation(true)
        saveVariations(variations)
        if variations == 0 {
            hideBasket(true)
        }
    }
}
    
    extension UIImageView {
        func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
            contentMode = mode
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                }
            }.resume()
        }
        
        func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
            guard let url = URL(string: link) else { return }
            downloaded(from: url, contentMode: mode)
        }
    
    
}



