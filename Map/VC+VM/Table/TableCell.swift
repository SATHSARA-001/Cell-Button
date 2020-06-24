//
//  TableCell.swift
//  Map
//
//  Created by Sathsara Maduranga on 6/23/20.
//  Copyright © 2020 Sathsara Maduranga. All rights reserved.
//

import UIKit

protocol TableViewNew {
    func onClickCell(index : Int)
    func onClickApple(index: Int)
}

class TableCell: UITableViewCell {
    
    @IBOutlet weak var lblPlaceName: UILabel!
    @IBOutlet weak var lblPlaceAddress: UILabel!
    @IBOutlet weak var btnGMaps: UIButton!
    @IBOutlet weak var btnAppleMaps: UIButton!
    
    var got : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var cellDelegate : TableViewNew?
    var index : IndexPath?
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func clickOnGmaps(_ sender: UIButton) {
        
        cellDelegate?.onClickCell(index: (index?.row)!)
        
    }
    
    @IBAction func clickOnAppleMap(_ sender: UIButton) {
        
        cellDelegate?.onClickApple(index: (index?.row)!)
        
    }
    
    
    
}
