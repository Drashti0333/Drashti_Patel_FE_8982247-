//
//  DirectionsTableViewCell.swift
//  Drashti_Patel_FE_8982247
//
//  Created by user236597 on 4/11/24.
//

import UIKit

class DirectionsTableViewCell: UITableViewCell {

    @IBOutlet weak var citynmeLabel: UILabel!
    @IBOutlet weak var totalDistanceLabel: UILabel!
    @IBOutlet weak var modeofTravelLabel: UILabel!
    @IBOutlet weak var endPointLabel: UILabel!
    @IBOutlet weak var startPointLabel: UILabel!
    
    func setup(data: DirectionsData) {
        citynmeLabel.text = data.cityName ?? ""
        totalDistanceLabel.text = data.distance ?? ""
        modeofTravelLabel.text = data.method
        endPointLabel.text = data.endPoint ?? ""
        startPointLabel.text = data.startPoint ?? ""
    }
}
