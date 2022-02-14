//
//  CardTableViewCell.swift
//  PeretzApp
//
//  Created by Герекмаз Газимагомедова on 12.02.2022.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var newLabel: UILabel!
    
    var id: Int = 0
    var count: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkCountValue()
        // В демонстрационных целях ставим рандомный Bool, потому что в апишке всегда false приходит :(
        newLabel.isHidden = Bool.random()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func checkCountValue() {
        if (self.count > 0) {
            removeBtn.isHidden = false
            countLabel.isHidden = false
        } else {
            removeBtn.isHidden = true
            countLabel.isHidden = true
        }
    }

    @IBAction func add(_ sender: Any) {
        count += 1
        self.countLabel.text = String(count)
        checkCountValue()
    }
    
    @IBAction func remove(_ sender: Any) {
        count -= 1
        self.countLabel.text = String(count)
        checkCountValue()
    }
}
