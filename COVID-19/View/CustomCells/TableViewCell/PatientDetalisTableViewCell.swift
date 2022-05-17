//
//  PatientDetalisTableViewCell.swift
//  COVID-19
//
//  Created by R & W on 16/05/22.
//

import UIKit

class PatientDetalisTableViewCell: UITableViewCell {

    @IBOutlet weak var patientIdLabel: UILabel!
    @IBOutlet weak var reportedOnLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpLabels()
        setUpBgColor()
    }
    
    private func setUpLabels(){
        setUpLabelCorners(Corners: patientIdLabel)
        setUpLabelCorners(Corners: reportedOnLabel)
        setUpLabelCorners(Corners: stateLabel)
        setUpLabelCorners(Corners: ageLabel)
        setUpLabelCorners(Corners: cityLabel)
        setUpLabelCorners(Corners: districtLabel)
        setUpLabelCorners(Corners: statusLabel)
        setUpLabelCorners(Corners: notesLabel)
    }
    
    private func setUpLabelCorners(Corners: UILabel){
        Corners.layer.cornerRadius = 10
        Corners.layer.masksToBounds = true
        Corners.layer.borderWidth = 1
        Corners.layer.borderColor = UIColor(red: 68/255.0, green: 61/255.0, blue: 144/255.0, alpha: 1).cgColor
        
    }
    
    private func setUpBgColor(){
        if statusLabel.text == "Recovered"{
            statusLabel.layer.backgroundColor = UIColor(red: 64/255.0, green: 255/255.0, blue: 0/255.0, alpha: 1).cgColor
            //statusLabel.textColor = .white
        }
        else if statusLabel.text == "Hospitalized"{
            statusLabel.layer.backgroundColor = UIColor(red: 245/255.0, green: 102/255.0, blue: 0/255.0, alpha: 1).cgColor
            statusLabel.textColor = .white
        }
        else if statusLabel.text == "Deceased"{
            statusLabel.layer.backgroundColor = UIColor(red: 255/255.0, green: 0/255.0, blue: 17/255.0, alpha: 1).cgColor
            statusLabel.textColor = .white
        }
    }
    
}
