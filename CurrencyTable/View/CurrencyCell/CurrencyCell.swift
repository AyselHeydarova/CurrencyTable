//
//  CurrencyCell.swift
//  CurrencyTable
//
//  Created by Aysel Heydarova on 10/21/20.
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet weak var flagIcon: UIImageView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var radioButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpCell(currency: Currency) {
        currencyLabel.text = currency.currency
        flagIcon.image = currency.flagIcon
//        flagIcon.layer.cornerRadius = setCornerRadius()
        radioButton.isSelected = currency.isSelected!
    }
    
    func setCornerRadius()  -> CGFloat {
        let cornerRadius = flagIcon.frame.size.width / 2
        print("cornerRadius", cornerRadius)
        return cornerRadius
        
        }
}
